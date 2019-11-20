require_relative "board"
class Sudoku

  def self.get_game_parameters
    acceptable_nums = ("1".."3").to_a
    puts "Welcome to a game of Sudoku =)"
    puts "Which puzzle would you like to solve (1, 2, 3)?"
    puzzle_num = gets.chomp
    until acceptable_nums.include?(puzzle_num)
      puts "Please enter a puzzle number 1, 2, or 3"
      puzzle_num = gets.chomp
    end
    file_name = "./puzzles/sudoku" + puzzle_num + ".txt"
  end

  def initialize
    
  end
end

