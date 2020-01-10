class Sloth
  attr_reader :name, :foods
  def initialize(name)
    @name = name
    @foods = []
  end

  def eat(food)
    @foods << food
  end
end