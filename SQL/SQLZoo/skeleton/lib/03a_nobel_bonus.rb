# == Schema Information
#
# Table name: nobels
#
#  yr          :integer
#  subject     :string
#  winner      :string

require_relative './sqlzoo.rb'

def physics_no_chemistry
  # In which years was the Physics prize awarded, but no Chemistry prize?
  # This works in SQL Zoo, so wtf?
  execute(<<-SQL)
  SELECT winner, subject, subject IN ('Physics','Chemistry')
  FROM nobels
 WHERE yr=1984
 ORDER BY subject,winner
  SQL
end
