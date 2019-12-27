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
      print row.to_s + "| "
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
    puts "   " + (0...8).to_a.join(" ")
  end
end

if __FILE__ == $PROGRAM_NAME
  disp = Display.new(Board.new)
  disp.board.move_piece([0,1], [5,4])
  puts disp.board.in_check?(:black)
  puts disp.board.checkmate?(:black)
  
  disp.board.move_piece([6,3], [5,3])
  puts disp.board.in_check?(:black)
  puts disp.board.checkmate?(:black)

  p disp.board[[5,4]].valid_moves
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