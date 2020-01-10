class Dessert
  attr_reader :type, :amount

  def initialize(type, amount)
    raise "amount must be a number" unless amount.is_a?(Numeric)
    @amount = amount
    @type = amount > 100 ? "giant #{type}" : type
  end

  def eat(drink)
    drink.dip(self)
  end
end