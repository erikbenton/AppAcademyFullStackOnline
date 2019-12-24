require "colorize"
require_relative "cursor.rb"
require_relative "board.rb"
class Display
  attr_accessor :board

  def initialize(board)
    @board = board
    @cursor = Cursor.new([0,0], board)
  end

  def render
    board.rows.each do |row|
      row.each do |piece|
        print piece.symbol + " "
      end
      puts
    end
  end
end

if __FILE__ == $PROGRAM_NAME
  disp = Display.new(Board.new)
  disp.render
end