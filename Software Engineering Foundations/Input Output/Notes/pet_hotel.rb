require_relative "./cat.rb"
require_relative "./other_animals/dog.rb"

class PetHotel
  def initialize(name)
    @name = name
    @guests = []
  end

  def check_in(guest)
    @guests << guest
  end
end

# class Cat
#   def initialize(name)
#     @name = name
#   end
# end

# class Dog
#   def initialize(name)
#     @name = name
#   end
# end

hotel = PetHotel.new("Animal Inn")

cat_1 = Cat.new("Sennacy")
cat_2 = Cat.new("Whiskers")

dog_1 = Dog.new("Shadow")
dog_2 = Dog.new("Riley")

hotel.check_in(cat_1)
hotel.check_in(cat_2)

hotel.check_in(dog_1)
hotel.check_in(dog_2)

p hotel