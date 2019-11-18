class Card

  def initialize(val)
    @value = val
    @facing_down = true
  end

  def hide
    @facing_down = true
  end

  def reveal
    @facing_down = false
  end

  def facing_down?
    @facing_down
  end

  def to_s
    @value.to_s
  end

  def ==()
    
  end
end