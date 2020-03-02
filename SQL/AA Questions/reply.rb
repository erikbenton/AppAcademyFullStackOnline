require_relative "questions_database.rb"

class Reply
  attr_accessor :id, :question_id, :parent_id, :author_id, :body

  def self.all
    replies = QuestionsDBConnection.instance.execute(<<-SQL)
      SELECT
        *
      FROM
        replies;
    SQL
    replies.map { |reply| Reply.new(reply) }
  end

  def self.find_by_id(id)
    reply = QuestionsDBConnection.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        replies
      WHERE
        replies.id = ?;
    SQL
    raise "No reply with id: #{id}" if reply.nil? || reply.empty?
    Reply.new(reply.first)
  end

  def self.find_by_question_id(question_id)
    reply = QuestionsDBConnection.instance.execute(<<-SQL, question_id)
      SELECT
        *
      FROM
        questions
      WHERE
        questions.question_id = ?;
    SQL
    raise "No reply with question_id: #{question_id}" if reply.nil? || reply.empty?
    Reply.new(reply.first)
  end

  def self.find_by_author_id(author_id)
    reply = QuestionsDBConnection.instance.execute(<<-SQL, author_id)
      SELECT
        *
      FROM
        questions
      WHERE
        questions.author_id = ?;
    SQL
    raise "No reply with author_id: #{author_id}" if reply.nil? || reply.empty?
    Reply.new(reply.first)
  end

  def initialize(options)
    @id = options['id']
    @question_id = options['question_id']
    @parent_id = options['parent_id']
    @author_id = options['author_id']
    @body = options['body']
  end
end

if __FILE__ == $PROGRAM_NAME
  p Reply.all
  p Reply.find_by_id(1)
end