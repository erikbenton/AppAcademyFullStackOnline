require_relative "display.rb"
require_relative "piece.rb"
class Player
  attr_reader :color, :display
  attr_writer :color, :display
  def initialize(color, display)
    @color = color
    @display = display    
  end

  def make_move
    begin
      display.cursor.get_input
      piece = display.cursor.selected
      if piece.is_a?(Piece)
        unless piece.color == @color
          @display.cursor.selected = false
          raise "Wrong color piece"
        end
      end
    rescue => exception
      puts exception.message
      retry
    end
    system("clear")
    display.render
    if piece == true && !piece.is_a?(Piece)
      @display.cursor.selected = false
      return true
    end
    return false
  end
end