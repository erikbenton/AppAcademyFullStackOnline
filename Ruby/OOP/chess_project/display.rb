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
    (0...8).each do |row|
      (0...8).each do |col|
        pos = [row, col]
        if pos == cursor.cursor_pos
          print "C" + " "
        else
          print board[pos].symbol + " "
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
    system("clear")
    disp.render
  end
end