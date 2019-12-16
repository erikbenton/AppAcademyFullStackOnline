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
    return "#{self.class.to_s} @ #{pos}" if color.nil?
    "#{color.capitalize} #{self.class.to_s} @ #{pos}"
  end

  def symbol
    return "P"
  end

end