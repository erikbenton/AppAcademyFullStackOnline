require_relative "piece.rb"
class NullPiece < Piece

  def initialize(color, board, pos)
    super(nil, nil, pos)
  end
end

if __FILE__ == $PROGRAM_NAME

  np = NullPiece.new(:white, nil, [0,2])
  p np.pos

end