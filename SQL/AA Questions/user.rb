require_relative 'questions_database.rb'
require_relative 'question.rb'
require_relative 'reply.rb'
require_relative 'question_follow.rb'
require_relative 'question_like.rb'
require 'byebug'

class User
  attr_accessor :id, :fname, :lname

  def self.all
    users = QuestionsDBConnection.instance.execute(<<-SQL)
      SELECT
        *
      FROM
        users;
    SQL
    users.map { |user| User.new(user) }
  end

  def self.find_by_id(id)
    user = QuestionsDBConnection.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        users
      WHERE
        users.id = ?;
    SQL
    raise "No user with id: #{id}" if user.nil? || user.empty?
    User.new(user.first)
  end

  def self.find_by_name(fname, lname)
    user = QuestionsDBConnection.instance.execute(<<-SQL, fname, lname)
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