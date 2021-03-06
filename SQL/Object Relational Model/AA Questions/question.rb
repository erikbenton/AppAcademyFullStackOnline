require_relative 'questions_database.rb'
require_relative 'model_base'
require_relative 'user.rb'
require_relative 'reply.rb'
require_relative 'question_follow.rb'
require_relative 'question_like.rb'

class Question < ModelBase
  attr_accessor :id, :title, :body, :author_id
  
  def self.find_by_author_id(author_id)
    questions = QuestionsDBConnection.execute(<<-SQL, author_id)
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

end

if __FILE__ == $PROGRAM_NAME
  p Question.all
  
  first_q = Question.find_by_id(1)

  puts

  p first_q.author
end