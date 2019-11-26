require_relative "player"
require_relative "board"
class Minesweeper
  attr_reader :board, :player

  def self.get_parameters
    system "clear"
    puts "Welcome to a game of Minesweeper!"
    puts "What size of board would you like to play with?"
    size = nil
    until size and size.to_i > 0
      size = gets.chomp.to_i
    end
    game = Minesweeper.new(size)
    game.play_turn
  end

  def initialize(size)
    @board = Board.new(size)
    @player = Player.new
  end

  def play_turn
    board.render
    until board.over?
      pos = nil
      pos = player.prompt
      pos == "reveal" ? board.reveal : (system "clear")
      until pos && board.valid_position?(pos)
        puts "That was outside the range of the board"
        pos = player.prompt
      end
      if !board.check_position(pos)
        board.render
        puts "You found a bomb =("
        break
      end
      board.render
    end
  end
end

if __FILE__ == $PROGRAM_NAME
  Minesweeper.get_parameters
end