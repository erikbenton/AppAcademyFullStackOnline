require "player"

class Minesweeper
  attr_reader :board, :player
  def initialize(size)
    @board = Board.new(size)
    @player = Player.new
  end

  def play_turn
    board.render
    pos = nil
    pos = player.prompt
    until pos && board.valid_position?(pos)
      puts "That was outside the range of the board"
      pos = player.prompt
    end
    board.check_position(pos)
  end
end

if __FILE__ == $PROGRAM_NAME

end