require_relative "piece.rb"
require_relative "stepable.rb"
class Knight < Piece
  include Stepable

  def symbol
    return "K"
  end

  protected

  def move_diffs
    [[1,2], [2,1], [-2,1], [-1,2], [-1,-2], [-2,-1]]
  end
end

class King < Piece
  include Stepable
  
  def symbol
    return "$"
  end

  protected

  def move_diffs
    [[1,1],[-1,1],[1,-1],[-1,-1], [1,0],[-1,0],[0,1],[0,-1]]
  end
end