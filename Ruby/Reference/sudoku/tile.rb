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
end