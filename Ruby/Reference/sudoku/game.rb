class Sudoku

  def self.get_game_paramters
    puts "Welcome to a game of Sudoku =)"
    puts "Which puzzle would you like to solve (1, 2, 3)?"
    puzzle_num = gets.chomm.to_i
    until puzzle_num.between?(1,3)
      puts "Please enter a puzzle number 1, 2, or 3"
      puzzle_num = gets.chomp.to_i
    end
  end

  def initialize
    
  end
end

