# Falsey
#   false
#   nil
# Truthy
#   everything else

def print_truthy(val)
  if val
    puts "true"
  else
    puts "false"
  end
end

print_truthy(false)
print_truthy(nil)
print_truthy(0)
print_truthy("")
print_truthy([])

puts

# 'and' and 'or' special return values

# a and b
#   if a == true, returns a
#   if a == false, returns b
p true and 666
p 666 and true
p false and 666
p 666 and false
p false and "hello"
p nil and "hello"
p "hi" and "hello"
p 0 and true
p false and nil

puts

# a or b
#   if a == true, returns a
#   if a == false, returns b
p true or 666
p 666 or true
p false or 666
p 666 or false
p false or "hello"
p nil or "hello"
p "hi" or "hello"
p 0 or true
p false or nil

puts

# Default Arguments
def greet(name=nil) # but really just greet(name="you")
  name ||= "you"
  puts " Hey " + name
end

greet("Erik")
greet

# Default Procs
def call_that_proc(val, &prc)
  prc ||= Proc.new { |data| data.upcase! + "!!" }
  prc.call(val)
end

p call_that_proc("hey")
p call_that_proc("hey programmer") { |word| word.capitalize! }

puts

# Lazy Initialization
# Only create costly objects when they are needed
class Restaurant
  attr_reader :name, :chefs

  def initialize(name, chefs)
    @name = name
    @chefs = chefs
    # @menu = ["ravioli", "steak", "salad"]
  end

  def menu
    @menu ||= ["ravioli", "steak", "salad"]
  end
end

five_star_restaurant = Restaurant.new("Appetizer Academy", ["Marta", "Jon", "Soon-Mi"])
p five_star_restaurant
five_star_restaurant.menu
p five_star_restaurant