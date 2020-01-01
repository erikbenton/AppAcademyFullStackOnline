require "colorize"
require_relative "cursor.rb"
<<<<<<< HEAD
=======
require_relative "board.rb"
>>>>>>> 808e341ec27a76988dc824f571c3f08e1df8fde8
class Display
  attr_accessor :board, :cursor

  def initialize(board)
<<<<<<< HEAD
    @cursor = Cursor.new([0,0], board)
  end

=======
    @board = board
    @cursor = Cursor.new([0,0], board)
  end

  def render
    columns = ("A".."H").to_a
    (0...8).each do |row|
      print ((row + 1).to_s + "| ").colorize(:color => :white, :background => :black)
      (0...8).each do |col|
        pos = [row, col]
        piece = board[pos]
        foreground = nil
        background = (row + col).even? ? :blue : :cyan
        symbol = piece.symbol
        if piece.is_a?(NullPiece)
          foreground = background
        else
          foreground = piece.color
        end
        if cursor.selected.is_a?(Piece)
          if cursor.selected.valid_moves.include?(pos)
            if symbol == " "
              symbol = "X"
              foreground = :magenta
            else
              background = :magenta
            end
          end
        end
        if pos == cursor.cursor_pos
          foreground = piece.color
          background = :red
        end
        print (symbol + " ").colorize(:color => foreground, :background => background)
      end
      puts
    end
    puts ("   " + ("A".."H").to_a.join(" ") + " ").colorize(:color => :white, :background => :black)
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
>>>>>>> 808e341ec27a76988dc824f571c3f08e1df8fde8
end