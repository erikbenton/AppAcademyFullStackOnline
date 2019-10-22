FOOD = "pizza"   # Constant
$food = "burger" # Global
def my_method
  # food = "orange"
  p FOOD
  FOOD[0] = "P"
  p FOOD
  p $food
end
my_method
p $food

message = "hi"
3.times do
  p message
end

if true
  message = "bye"
end

p message