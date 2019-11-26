class Tile
  def initialize(value="X", revealed=false, flagged=false)
    @value = value
    @revealed = revealed
    @flagged = flagged
  end

  def value
    @value
  end

  def value=(val)
    @value = val
  end

  def to_s
    if flagged?
      return "F"
    end
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

  def flag
    @flagged = true
  end

  def flagged?
    @flagged
  end
end