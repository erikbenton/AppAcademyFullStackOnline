class Robot
  attr_reader :position, :items, :health
  attr_accessor :equipped_weapon

  def initialize()
    @position = [0, 0]
    @items = []
    @health = 100
    @equipped_weapon = nil
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

  def wound(damage)
    @health -= damage
    @health = 0 if @health < 0
    @health
  end

  def heal(hp)
    @health += hp
    @health = 100 if @health > 100
    @health
  end

  def attack(opponent)
    if @equipped_weapon.nil?
      opponent.wound(5)
    else
      @equipped_weapon.hit(opponent)
    end
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
    super("bolts", 25)
  end

  def feed(robot)
    robot.heal(25)
  end
end

class Weapon < Item
  attr_reader :damage

  def initialize(name, weight, damage)
    super(name, weight)
    @damage = damage
  end

  def hit(robot)
    robot.wound(@damage)
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