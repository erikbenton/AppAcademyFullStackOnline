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
      print (row.to_s + "| ").colorize(:color => :white, :background => :cyan)
      (0...8).each do |col|
        pos = [row, col]
        piece = board[pos]
        foreground = nil
        background = nil
        if piece.is_a?(NullPiece)
          foreground = :cyan
          background = :cyan
        else
          foreground = piece.color
          background = :cyan
        end
        if cursor.selected != false
          if cursor.selected.valid_moves.include?(pos)
            background = :magenta
          end
        end
        if pos == cursor.cursor_pos
          foreground = piece.color
          background = :red
        end
        print piece.symbol.colorize(:color => foreground, :background => background)
        print " ".colorize(:color => :cyan, :background => :cyan)
      end
      puts
    end
    puts ("   " + (0...8).to_a.join(" ") + " ").colorize(:color => :white, :background => :cyan)
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
    piece = disp.cursor.selected
    if piece != false
      puts
      puts "Your selected piece is: #{piece.class} at #{piece.pos}"
      puts "With moves to:"
      piece.valid_moves.each { |move| p move}
    end
  end
end