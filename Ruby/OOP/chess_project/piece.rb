require "byebug"
class Piece

  attr_reader :color, :board, :pos

  def initialize(color, board, pos)
    @color = color
    @board = board
    @pos = pos
  end

  def pos=(val)
    @pos = val
  end

  def to_s
    return "Null Piece" if self.is_a?(NullPiece)
    "#{color.capitalize} #{self.class.to_s} @ #{pos}"
  end

  def symbol
    return "P"
  end

  def valid_moves
    raise "No valid moves for a Null Piece" if self.class == NullPiece
    possible_moves = self.moves
    all_valid_moves = possible_moves.select do |move|
      new_board = board.move_piece!(color, self.pos, move)
      !new_board.in_check?(color)
    end
    all_valid_moves
  end

  def empty?
    self.is_a?(NullPiece)
  end

  def opponent?(piece)
    (self.color != piece.color) && !piece.empty?
  end

end