require_relative "questions_database.rb"
require_relative 'user.rb'
require_relative 'question.rb'

class QuestionLike
  attr_accessor :id, :user_id, :question_id
  def self.all
    likes = QuestionsDBConnection.instance.execute(<<-SQL)
      SELECT
        *
      FROM
        question_likes;
    SQL
    likes.map { |like| QuestionLike.new(like) }
  end

  def self.find_by_id(id)
    like = QuestionsDBConnection.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        question_likes
      WHERE
        question_likes.id = ?;
    SQL
    raise "No like with id: #{id}" if like.nil? || like.empty?
    QuestionLike.new(like.first)
  end

  def self.likers_by_question_id(question_id)
    likers = QuestionsDBConnection.instance.execute(<<-SQL, question_id)
      SELECT
        users.*
      FROM
        users
      JOIN
        question_likes
      ON
        question_likes.user_id = users.id
      WHERE
        question_likes.question_id = ?;
    SQL
    likers.map { |liker| User.new(liker) }
  end

  def self.num_likes_for_question_id(question_id)
    count = QuestionsDBConnection.instance.execute(<<-SQL, question_id)
      SELECT
        COUNT(users.id) AS 'num_likes'
      FROM
        users
      JOIN
        question_likes
      ON
        question_likes.user_id = users.id
      WHERE
        question_likes.question_id = ?;
    SQL
    count.first['num_likes']
  end

  def self.liked_questions_for_user_id(user_id)
    liked_questions = QuestionsDBConnection.instance.execute(<<-SQL, user_id)
      SELECT
        questions.*
      FROM
        questions
      JOIN
        question_likes
      ON
        questions.id = question_likes.question_id
      WHERE
        question_likes.user_id = ?;
    SQL
    liked_questions.map { |liked| Question.new(liked) }
  end

  def initialize(options)
    @id = options['id']
    @user_id = options['user_id']
    @question_id = options['question_id']
  end
end

if __FILE__ == $PROGRAM_NAME
  p QuestionLike.all
  p QuestionLike.find_by_id(1)
end