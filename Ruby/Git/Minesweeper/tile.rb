class Tile
  def initialize(value="X", revealed=false)
    @value = value
    @revealed = revealed
  end

  def value
    @value
  end

  def value=(val)
    @value = val
  end

  def to_s
    @value.to_s
  end

  def revealed?
    @revealed
  end

  def bomb?
    self.to_s == "B"
  end

  def reveal
    @revealed = true
  end
end