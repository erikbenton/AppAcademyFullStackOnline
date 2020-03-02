require_relative "questions_database.rb"

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
  end

  def initialize(options)
    @id = options['id']
    @question_id = options['question_id']
    @follower_id = options['followe_id']
  end
end

if __FILE__ == $PROGRAM_NAME
  p QuestionFollow.all
  p QuestionFollow.find_by_id(1)
end