class Dog
  def initialize(name, age, favorite_food)
    @name = name
    @age = age
    @favorite_food = favorite_food
  end

  # Getters
  def name
    @name
  end

  def age
    @age
  end

  # Setters
  def name=(new_name)
    @name = new_name
  end

  def age=(new_age)
    @age = new_age
  end
end

# VS

class Cat

  attr_reader :name # Easy getter
  attr_writer :name # Easy setter
  attr_accessor :age # Easy getter/setter

  def initialize(name, age, favorite_food)
    @name = name
    @age = age
    @favorite_food = favorite_food
  end
end

cat = Cat.new("Maya", 3, "cheese")
p "Kitty's name is: #{cat.name}"
cat.name = "Miya"
p "Kitty's actual name is: #{cat.name}"
p "Kitty's age is: #{cat.age}"
cat.age += 1
p "Happy birthday #cat.name! Kitty's age is: #{cat.age}"