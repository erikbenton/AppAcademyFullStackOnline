require "colorize"
require_relative "cursor.rb"
require_relative "board.rb"
class Display
  attr_accessor :board, :cursor

  def initialize(board)
    @board = board
    @cursor = Cursor.new([0,0], board)
  end

  def render
    board.rows.each do |row|
      row.each do |piece|
        if piece.pos == cursor.cursor_pos
          print "C" + " "
        else
          print piece.symbol + " "
        end
      end
      puts
    end
  end
end

if __FILE__ == $PROGRAM_NAME
  disp = Display.new(Board.new)
  disp.render
  while true
    begin
      disp.cursor.get_input
    rescue => exception
      puts exception.message
      retry
    end
    puts
    disp.render
  end
end