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
        if pos == cursor.cursor_pos
          print piece.symbol.colorize(:color => piece.color, :background => :red)
        elsif piece.is_a?(NullPiece)
          print piece.symbol.colorize(:color => :cyan, :background => :cyan)
        else
          print piece.symbol.colorize(:color => piece.color, :background => :cyan)
        end
        print " ".colorize(:color => :cyan, :background => :cyan)
      end
      puts
    end
    puts ("   " + (0...8).to_a.join(" ") + " ").colorize(:color => :white, :background => :cyan)
  end
end

if __FILE__ == $PROGRAM_NAME
#   String.colors                       # return array of all possible colors names
# String.modes                        # return array of all possible modes
# String.color_samples                # displays color samples in all combinations
# String.disable_colorization         # check if colorization is disabled
# String.disable_colorization = false # enable colorization
# String.disable_colorization false   # enable colorization
# # String.disable_colorization = true  # disable colorization
# # String.disable_colorization true    # disable colorization

# puts "This is blue".colorize(:color => :black, :background => :light_black)
# puts "This is blue".colorize(:color => :black, :background => :cyan)
# puts "This is light blue".colorize(:light_blue)
# puts "This is also blue".colorize(:color => :blue)
# puts "This is light blue with red background".colorize(:color => :light_blue, :background => :red)
# puts "This is light blue with red background".colorize(:light_blue ).colorize( :background => :red)
# puts "This is blue text on red".blue.on_red
# puts "This is red on blue".colorize(:red).on_blue
# puts "This is red on blue and underline".colorize(:red).on_blue.underline
# puts "This is blue text on red".blue.on_red.blink
# puts "This is uncolorized".blue.on_red.uncolorize
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
      puts "Your selected piece is: #{piece.class}, at #{piece.pos}"
      puts "With moves to:"
      piece.valid_moves.each { |move| p move}
    end
  end
end