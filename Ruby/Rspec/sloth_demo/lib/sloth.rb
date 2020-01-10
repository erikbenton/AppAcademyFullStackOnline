class Sloth
  attr_reader :name, :foods, :drinks
  def initialize(name)
    @name = name
    @foods = []
    @drinks = Hash.new { |h, k| h[k] = 0 }
  end

  def eat(food)
    @foods << food
  end

  def drink(beverage, amount)
    @drinks[beverage] += amount
  end

  def run(direction)
    valid_directions = ["west", "east", "south", "north"]
    raise ArgumentError if valid_directions.none? { |dir| direction.downcase.include?(dir)}
    "I'm running #{direction} @ 0.001mph"
  end

  protected
  def secret_sloth
    "Shhh... this is a secret"
  end
end