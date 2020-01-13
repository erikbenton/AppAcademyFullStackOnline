class Robot
  attr_reader :position, :items, :health
  
  def initialize()
    @position = [0, 0]
    @items = []
    @health = 100
  end

  def move_left
    @position[0] -= 1
  end
  
  def move_right
    @position[0] += 1
  end

  def move_up
    @position[1] += 1
  end

  def move_down
    @position[1] -= 1
  end

  def pick_up(item)
    raise ArgumentError if (items_weight + item.weight) > 250
    @items.push(item)
  end

  def items_weight
    items.sum { |item| item.weight }
  end
end

class Item
  attr_reader :name, :weight

  def initialize(name, weight)
    @name = name
    @weight = weight
  end
end

class Bolts < Item
  def initialize()
    super("bolt", 25)
  end
end

class Weapon < Item
  attr_reader :damage

  def initialize(name, weight, damage)
    super(name, weight)
    @damage = damage
  end
end

class Laser < Weapon
  def initialize()
    super("laser", 125, 25)
  end
end

class PlasmaCannon < Weapon
  def initialize()
    super("plasma_cannon", 200, 55)
  end
end