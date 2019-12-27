require_relative "display.rb"
require_relative "player.rb"
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
  game = Game.new
  game.display.render
  p game.current_player
  game.swap_turn!
  puts
  p game.current_player
  while true
    begin
      game.display.cursor.get_input
    rescue => exception
      puts exception.message
      retry
    end
    system("clear")
    game.display.render
    piece = game.display.cursor.selected
    if piece != false
      puts
      puts "Your selected piece is: #{piece.class} at #{piece.pos}"
      puts "With moves to:"
      piece.valid_moves.each { |move| p move}
    end
  end
end