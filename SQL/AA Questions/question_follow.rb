require_relative "questions_database.rb"
require_relative 'user.rb'
require_relative 'question.rb'

class QuestionFollow
  attr_accessor :id, :question_id, :follower_id
  def self.all
    follows = QuestionsDBConnection.instance.execute(<<-SQL)
      SELECT
        *
      FROM
        question_follows;
    SQL
    follows.map { |follow| QuestionFollow.new(follow) }
  end

  def self.find_by_id(id)
    follow = QuestionsDBConnection.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        question_follows
      WHERE
        question_follows.id = ?;
    SQL
    QuestionFollow.new(follow.first)
  end

  def self.followers_for_question_id(question_id)
    followers = QuestionsDBConnection.instance.execute(<<-SQL, question_id)
      SELECT
        users.*
      FROM
        users
      JOIN
        question_follows
      ON
        users.id = question_follows.follower_id
      WHERE
        question_follows.question_id = ?;
    SQL
    followers.map { |follower| User.new(follower) }
  end

  def self.followed_questions_for_user_id(user_id)
    questions = QuestionsDBConnection.instance.execute(<<-SQL, user_id)
      SELECT
        questions.*
      FROM
        questions
      JOIN
        question_follows
      ON
        questions.id = question_follows.question_id
      WHERE
        question_follows.follower_id = ?;
    SQL
    questions.map { |question| Question.new(question) }
  end

  def self.most_followed_questions(n)
    most_followed = QuestionsDBConnection.instance.execute(<<-SQL, n)
      SELECT
        questions.*
      FROM
        questions
      JOIN
        question_follows
      ON
        question_follows.question_id = questions.id
      GROUP BY
        questions.id
      ORDER BY
        COUNT(*) DESC
      LIMIT
        ?;
    SQL
    most_followed.map { |question| Question.new(question) }
  end

  def initialize(options)
    @id = options['id']
    @question_id = options['question_id']
    @follower_id = options['follower_id']
  end
end

if __FILE__ == $PROGRAM_NAME
  p QuestionFollow.all
  p QuestionFollow.find_by_id(1)
  puts
  p QuestionFollow.followers_for_question_id(1)
  p QuestionFollow.followed_questions_for_user_id(1)
end