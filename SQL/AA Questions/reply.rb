require_relative 'questions_database.rb'
require_relative 'model_base'
require_relative 'user.rb'
require_relative 'question.rb'

class Reply < ModelBase
  attr_accessor :id, :question_id, :parent_id, :author_id, :body

  def self.find_by_question_id(question_id)
    replies = QuestionsDBConnection.execute(<<-SQL, question_id)
      SELECT
        *
      FROM
        replies
      WHERE
        replies.question_id = ?;
    SQL
    raise "No replies with question_id: #{question_id}" if replies.nil? || replies.empty?
    replies.map { |reply| Reply.new(reply.first) }
  end

  def self.find_by_author_id(author_id)
    replies = QuestionsDBConnection.execute(<<-SQL, author_id)
      SELECT
        *
      FROM
        replies
      WHERE
        replies.author_id = ?;
    SQL
    raise "No replies with author_id: #{author_id}" if replies.nil? || replies.empty?
    replies.map { |reply| Reply.new(reply) }
  end

  def initialize(options)
    @id = options['id']
    @question_id = options['question_id']
    @parent_id = options['parent_id']
    @author_id = options['author_id']
    @body = options['body']
  end

  def author
    User.find_by_id(@author_id)
  end

  def question
    Question.find_by_id(@question_id)
  end

  def parent_reply
    return nil if @parent_id.nil?
    Reply.find_by_id(@parent_id)
  end

  def child_replies
    children = QuestionsDBConnection.execute(<<-SQL, @id)
      SELECT
        *
      FROM
        replies
      WHERE
        replies.parent_id = ?;
    SQL
    children.map { |child| Reply.new(child) }
  end

  def save
    @id.nil? ? insert : update
  end

  private

  def insert
    QuestionsDBConnection.execute(<<-SQL, @question_id, @parent_id, @author_id, @body)
      INSERT INTO
        replies (question_id, parent_id, author_id, body)
      VALUES
        (?, ?, ?, ?);
    SQL
    @id = QuestionsDBConnection.last_insert_row_id
  end

  def update
    begin
      QuestionsDBConnection.execute(<<-SQL, @question_id, @parent_id, @author_id, @body, @id)
        UPDATE
          replies
        SET
          question_id = ?,
          parent_id = ?,
          author_id = ?,
          body = ?
        WHERE
          replies.id = ?;
      SQL
    rescue => exception
      return false
    end
    true
  end

end

if __FILE__ == $PROGRAM_NAME
  p Reply.all
  
  erik_reply = Reply.find_by_id(1)
  utas_reply = Reply.find_by_id(3)

  puts

  p erik_reply.child_replies.first.body
  p utas_reply.parent_reply.body
end