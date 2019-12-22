require_relative "piece.rb"
require_relative "slideable.rb"
class Rook < Piece
  include Slideable

  def self.move_dirs
    return :horizontal
  end

  def symbol
    return "R"
  end

end

class Bishop < Piece
  include Slideable

  def self.move_dirs
    return :diagonal
  end

  def symbol
    return "B"
  end
end

class Queen < Piece
  include Slideable

  def self.move_dirs
    return :both
  end

  def symbol
    return "Q"
  end
end