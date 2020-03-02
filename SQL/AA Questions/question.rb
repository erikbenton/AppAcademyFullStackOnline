require_relative 'questions_database.rb'

class Question
  
  def self.all
    attr_accessor :id, :title, :body, :author_id
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
    question = QuestionsDBConnection.instance.execute(<<-SQL, author_id)
      SELECT
        *
      FROM
        questions
      WHERE
        questions.author_id = ?;
    SQL
    raise "No question with author_id: #{author_id}" if question.nil? || question.empty?
    Question.new(question.first)
  end

  def initialize(options)
    @id = options['id']
    @title = options['title']
    @body = options['body']
    @author_id = options['author_id']
  end

end

if __FILE__ == $PROGRAM_NAME
  p Question.all
  p Question.find_by_id(1)
end