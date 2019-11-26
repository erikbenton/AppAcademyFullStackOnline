class Tile
  def initialize(value="X", revealed=false)
    @value = value
    @revealed = revealed
  end

  def value
    @value
  end

  def to_s
    @value.to_s
  end

  def revealed?
    @revealed
  end

  def reveal
    @revealed = true
  end
end