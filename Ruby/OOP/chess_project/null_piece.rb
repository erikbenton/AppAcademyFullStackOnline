require_relative "piece.rb"
require "singleton.rb"
class NullPiece < Piece
  include Singleton

  def initialize
    super(nil, nil, nil)
  end

  def symbol
    return "X"
  end
end

if __FILE__ == $PROGRAM_NAME

  np = NullPiece.new(:white, nil, [0,2])
  p np.to_s

end