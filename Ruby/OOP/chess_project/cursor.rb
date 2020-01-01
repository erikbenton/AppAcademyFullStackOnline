require "io/console"
require "byebug"
require_relative "piece.rb"

KEYMAP = {
  " " => :space,
  "h" => :left,
  "j" => :down,
  "k" => :up,
  "l" => :right,
  "w" => :up,
  "a" => :left,
  "s" => :down,
  "d" => :right,
  "q" => :deselect,
  "\t" => :tab,
  "\r" => :return,
  "\n" => :newline,
  "\e" => :escape,
  "\e[A" => :up,
  "\e[B" => :down,
  "\e[C" => :right,
  "\e[D" => :left,
  "\177" => :backspace,
  "\004" => :delete,
  "\u0003" => :ctrl_c,
}

MOVES = {
  left: [0, -1],
  right: [0, 1],
  up: [-1, 0],
  down: [1, 0]
}

class Cursor

  attr_accessor :cursor_pos, :board, :selected

  def initialize(cursor_pos, board)
    @cursor_pos = cursor_pos
    @board = board
    @selected = false
  end

  def get_input
    key = KEYMAP[read_char]
    handle_key(key)
  end

  private

  def read_char
    STDIN.echo = false # stops the console from printing return values

    STDIN.raw! # in raw mode data is given as is to the program--the system
                 # doesn't preprocess special characters such as control-c

    input = STDIN.getc.chr # STDIN.getc reads a one-character string as a
                             # numeric keycode. chr returns a string of the
                             # character represented by the keycode.
                             # (e.g. 65.chr => "A")

    if input == "\e" then
      input << STDIN.read_nonblock(3) rescue nil # read_nonblock(maxlen) reads
                                                   # at most maxlen bytes from a
                                                   # data stream; it's nonblocking,
                                                   # meaning the method executes
                                                   # asynchronously; it raises an
                                                   # error if no data is available,
                                                   # hence the need for rescue

      input << STDIN.read_nonblock(2) rescue nil
    end

    STDIN.cooked! # the opposite of raw mode :)
    STDIN.echo = true # the console prints return values again
    return input
  end

  def handle_key(key)
    case key
    when :ctrl_c
      Process.exit(0)
    when :space
      if @selected == false
        @selected = @board[@cursor_pos]
        @selected = false if @selected.is_a?(NullPiece)
      elsif @selected.is_a?(Piece)
        if @selected.valid_moves.include?(cursor_pos)
          board.move_piece(@selected.pos, cursor_pos)
          @selected = true
        else
          raise "Not a valid move"
        end
      end
    when :deselect
      @selected = false
    else
      diff = MOVES[key]
      begin
        update_pos(diff)
      rescue StandardError => exception
        puts exception.message
        get_input
      end
    end
  end

  def update_pos(diff)
    new_pos = []
    (0...diff.length).each do |idx|
      new_pos[idx] = diff[idx] + @cursor_pos[idx]
    end
    begin
      board.valid_pos?(new_pos)
      @cursor_pos = new_pos
    rescue => exception
      raise "Invalid Cursor Position"
    end
  end
end