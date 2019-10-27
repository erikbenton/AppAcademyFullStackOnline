# Agenda
# - why classes?
# - creating a class
# - instance variables / attributes
# - getters / setters
# - methods

class Cat
  def initialize(name, color, age)
    @name = name
    @color = color
    @age = age
  end

  # Get name
  def name
    @name
  end

  # Set name
  def name=(new_name)
    @name = new_name
  end

  def color
    @color
  end

  def color=(new_color)
    @color = new_color
  end

  def age
    @age
  end

  def age=(new_age)
    @age = new_age
  end

  def meow_at(person)
    puts "#{@name} meows at #{person}"
  end

end

my_cat = Cat.new("Satu", "Black", 2)
p my_cat.name
my_cat.name = "Kitty"
p my_cat.name
my_cat.meow_at("Me")

class Car
  NUM_WHEELS = 4
  @@num_wings = 0

  def self.upgrade_to_flying_cars
    @@num_wings = 4
    # NUM_WHEELS = 0
  end

  def initialize(color)
    @color = color
  end

  def num_wings
    @@num_wings
  end

  def num_wheels_and_wings
    "Wheels: #{NUM_WHEELS} Wings: #{@@num_wings}"
  end

end

car_1 = Car.new("red")
car_2 = Car.new("black")

p car_1.num_wheels_and_wings
p car_2.num_wheels_and_wings

Car.upgrade_to_flying_cars

p car_1.num_wheels_and_wings
p car_2.num_wheels_and_wings

car_3 = Car.new("silver")
p car_3.num_wheels_and_wings

class Dog
  def initialize(name)
    @name = name
  end

  def self.bark
    "WOOF!!!!"
  end

  def self.compare_dogs(dog_1, dog_2)
    if dog_1.name.length > dog_2.name.length
      return dog_1.name
    else
      return dog_2.name
    end
  end

  def name
    @name
  end

  def yell_name
    @name.upcase + "!"
  end

  def greet
    self.yell_name + " says hi."
  end
end

fido = Dog.new("Fido")
pupper = Dog.new("Pupper")
p fido.greet
# p fido.bark
p Dog.bark
p Dog.compare_dogs(fido, pupper)