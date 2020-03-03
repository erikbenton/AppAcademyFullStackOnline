require_relative 'questions_database.rb'
require_relative 'model_base'
require_relative 'question.rb'
require_relative 'reply.rb'
require_relative 'question_follow.rb'
require_relative 'question_like.rb'
require 'byebug'

class User < ModelBase
  attr_accessor :id, :fname, :lname

  def self.find_by_name(fname, lname)
    user = QuestionsDBConnection.execute(<<-SQL, fname, lname)
      SELECT
        *
      FROM
        users
      WHERE
        users.fname = ?
        AND users.lname = ?;
    SQL
    raise "No user with name: #{fname} #{lname}" if user.nil? || user.empty?
    User.new(user.first)
  end
  
  def initialize(options)
    @fname = options['fname']
    @id = options['id']
    @lname = options['lname']
  end

  def authored_questions
    Question.find_by_author_id(@id)
  end

  def authored_replies
    Reply.find_by_author_id(@id)
  end

  def followed_question
    QuestionFollow.followed_questions_for_user_id(@id)
  end

  def liked_questions
    QuestionLike.liked_questions_for_user_id(@id)
  end

  def average_karma
    questions_and_likes = QuestionsDBConnection.execute(<<-SQL, @id)
      SELECT
        CAST(COUNT(question_likes.id) AS FLOAT)
          / CAST(COUNT(DISTINCT(questions.id)) AS FLOAT)
        AS 'avg_karma'
      FROM
        questions
      LEFT OUTER JOIN
        question_likes
      ON
        questions.id = question_likes.question_id
      WHERE
        questions.author_id = ?;
    SQL
    questions_and_likes.first['avg_karma']
  end

  def save_1
    @id.nil? ? insert : update
  end

  private

  def insert_1
    QuestionsDBConnection.execute(<<-SQL, @fname, @lname)
      INSERT INTO
        users (fname, lname)
      VALUES
        (?, ?);
    SQL
    @id = QuestionsDBConnection.last_insert_row_id
  end

  def update_1
    QuestionsDBConnection.execute(<<-SQL, @fname, @lname, @id)
      UPDATE
        users
      SET
        fname = ?,
        lname = ?
      WHERE
        users.id = ?;
    SQL
  end

end

if __FILE__ == $PROGRAM_NAME
  p User.all
  p User.find_by_id(1)
  
  begin
    User.find_by_id(10)
  rescue => exception
    puts exception.message
  end

  puts

  erik = User.find_by_name("Erik", "Benton")

  puts erik.authored_questions
  puts
  erik.authored_replies.each do |reply|
    puts reply.body
  end


end