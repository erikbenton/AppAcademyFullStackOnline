require_relative "display.rb"
require_relative "player.rb"
require "byebug"
class Game
  attr_accessor :board, :display, :players, :current_player
  def initialize
    @board = Board.new
    @display = Display.new(@board)
    @players = {:white => Player.new(:white, @display), :black => Player.new(:black, @display) }
    @current_player = @players[:white]
  end

  def swap_turn!
    new_color = @current_player.color == :white ? :black : :white
    @current_player = @players[new_color]
  end
end

if __FILE__ == $PROGRAM_NAME
  system("clear")
  game = Game.new
  game.display.render
  puts "Current player is: #{game.current_player.color.to_s.capitalize}"
  until game.board.checkmate?(game.current_player.color)
    game.swap_turn! if game.current_player.make_move
    puts "Current player is: #{game.current_player.color.to_s.capitalize}"
  end
end