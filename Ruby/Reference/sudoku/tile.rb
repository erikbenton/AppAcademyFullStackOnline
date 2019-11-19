require "colorize"
class Tile
  def initialize(value)
    @value = value
    if value == 0
      @given = false
    else
      @given = true
    end
  end

  def to_s
    if @given
      return @value.to_s
    else
      return "X"
    end
  end
end