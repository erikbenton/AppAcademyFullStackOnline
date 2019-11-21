require "colorize"
class Tile
  attr_reader :given
  def initialize(value, given)
    @value = value
    @given = given
  end

  def to_s
    if @given
      return @value.to_s.green
    else
      if @value < 1
        return "X".red
      else
        return @value.to_s
      end
    end
  end

  def to_i
    @value
  end

  def given?
    @given
  end
end