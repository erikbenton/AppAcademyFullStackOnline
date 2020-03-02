require_relative "questions_database.rb"

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