class Dessert
  attr_reader :type, :amount

  def initialize(type, amount)
    @type = type
    @amount = amount
  end
end