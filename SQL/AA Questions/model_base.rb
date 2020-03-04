require 'active_support/inflector'
require_relative 'questions_database'

class ModelBase

  def self.table
    self.to_s.tableize
  end

  def self.all
    data = QuestionsDBConnection.execute(<<-SQL)
      SELECT
        *
      FROM
        #{table};
    SQL
    parse_data(data)
  end

  def self.find_by_id(id)
    datum = QuestionsDBConnection.get_first_row(<<-SQL, id)
      SELECT
        *
      FROM
        #{table}
      WHERE
        id = ?;
    SQL
    raise "No #{self.to_s.downcase} with id: #{id}" if datum.nil? || datum.empty?
    self.new(datum)
  end

  def self.where(parameters)
    where_line = where_parameters(parameters)
    data = QuestionsDBConnection.execute(<<-SQL)
      SELECT
        *
      FROM
        #{table}
      WHERE
        #{where_line}
    SQL
    parse_data(data)
  end

  def save
    @id.nil? ? insert : update
  end

  private

  def self.where_parameters(parameters)
    where_line = []
    parameters.each_pair do |k, v|
      where_line << "#{k} = \'#{v}\'"
    end
    where_line = where_line.join(" AND ") + ";"
    where_line
  end
  
  def attrs
    Hash[instance_variables.map do |var|
      [var[1..-1], instance_variable_get(var)]
    end]
  end
  
  def self.parse_data(data)
    data.map { |datum| self.new(datum) }
  end

  def insert
    instance_attrs = attrs
    instance_attrs.delete("id")
    parameters = instance_attrs.keys.join(", ")
    question_marks = (instance_attrs.keys.map { |param| "?" }).join(", ")
    values = instance_attrs.values
    QuestionsDBConnection.execute(<<-SQL, *values)
      INSERT INTO
        #{self.class.table} (#{parameters})
      VALUES
        (#{question_marks});
    SQL
    @id = QuestionsDBConnection.last_insert_row_id
  end

  def update  
    instance_attrs = attrs
    instance_attrs.delete("id")
    set_line = instance_attrs.keys.map { |attr| "#{attr} = ?" }.join(", ")
    values = instance_attrs.values
    QuestionsDBConnection.execute(<<-SQL, *values, id)
      UPDATE
        #{self.class.table}
      SET
        #{set_line}
      WHERE
        id = ?;
    SQL
    self
  end

end