require_relative 'questions_database.rb'
require_relative 'user.rb'
require_relative 'reply.rb'
require_relative 'question_follow.rb'
require_relative 'question_like.rb'

class Question
  attr_accessor :id, :title, :body, :author_id
  def self.all
    questions = QuestionsDBConnection.instance.execute(<<-SQL)
      SELECT
        *
      FROM
        questions;
    SQL
    questions.map { |question| Question.new(question) }
  end

  def self.find_by_id(id)
    question = QuestionsDBConnection.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        questions
      WHERE
        questions.id = ?;
    SQL
    raise "No question with id: #{id}" if question.nil? || question.empty?
    Question.new(question.first)
  end

  def self.find_by_author_id(author_id)
    questions = QuestionsDBConnection.instance.execute(<<-SQL, author_id)
      SELECT
        *
      FROM
        questions
      WHERE
        questions.author_id = ?;
    SQL
    raise "No questions with author_id: #{author_id}" if questions.nil? || questions.empty?
    questions.map { |question| Question.new(question) }
  end

  def self.most_followed(n)
    QuestionFollow.most_followed_questions(n)
  end

  def self.most_liked(n)
    QuestionLike.most_liked_questions(n)
  end

  def initialize(options)
    @id = options['id']
    @title = options['title']
    @body = options['body']
    @author_id = options['author_id']
  end

  def author
    User.find_by_id(@author_id)
  end

  def replies
    Reply.find_by_question_id(@id)
  end

  def followers
    QuestionFollow.followers_for_question_id(@id)
  end

  def likers
    QuestionLike.likers_by_question_id(@id)
  end

  def num_likers
    QuestionLike.num_likes_for_question_id(@id)
  end

  def save
    @id.nil? ? insert : update
  end

  private

  def insert
    QuestionsDBConnection.instance.execute(<<-SQL, @title, @body, @author_id)
      INSERT INTO
        questions (title, body, author_id)
      VALUES
        (?, ?, ?);
    SQL
    @id = QuestionsDBConnection.instance.last_insert_row_id
  end

  def update
    begin
      QuestionsDBConnection.instance.execute(<<-SQL, @title, @body, @author_id, @id)
        UPDATE
          questions
        SET
          title = ?,
          body = ?,
          author_id = ?
        WHERE
          questions.id = ?;
      SQL
    rescue => exception
      return false
    end
    true
  end

end

if __FILE__ == $PROGRAM_NAME
  p Question.all
  
  first_q = Question.find_by_id(1)

  puts

  p first_q.author
end