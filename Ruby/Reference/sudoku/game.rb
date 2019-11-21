require_relative "board"
require_relative "player"
class Game

  def self.get_game_parameters
    acceptable_nums = ("1".."3").to_a
    puzzle_num = Game.prompt
    until acceptable_nums.include?(puzzle_num)
      puts "Please enter a puzzle number 1, 2, or 3"
      puzzle_num = gets.chomp
    end
    file_name = "./puzzles/sudoku" + puzzle_num + ".txt"
    file_name
  end

  def self.prompt
    puts "Welcome to a game of Sudoku =)"
    puts "Which puzzle would you like to solve (1, 2, 3)?"
    puzzle_num = gets.chomp
    puzzle_num
  end

  def initialize
    puzzle_location = Game.get_game_parameters
    @player = Player.new("Erik")
    @board = Board.new(puzzle_location)
  end

  def play
    until self.over?
      @board.render
      guess = @player.get_guess
      until @board.valid_value?(guess)
        puts "Sorry, invalid input, try again"
        guess = @player.get_guess
      end
      @board[guess[0..1]] = guess[2]
    end
    @board.render
    puts "Congratulations!"
  end

  def over?
    @board.full?
  end
end

if __FILE__ == $PROGRAM_NAME
  game = Game.new
  game.play
end

