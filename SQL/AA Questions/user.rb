require_relative 'questions_database.rb'
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
  
  def initialize(options)
    @fname = options['fname']
    @id = options['id']
    @lname = options['lname']
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
  
end