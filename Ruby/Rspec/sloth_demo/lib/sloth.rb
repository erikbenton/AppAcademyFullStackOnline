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
end