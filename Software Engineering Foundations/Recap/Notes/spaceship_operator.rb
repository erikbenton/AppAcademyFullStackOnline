# Spaceship Operator <=>
# Tells exactly if a > b, a < b, or a == b
# a <=> b

a = -10
b = 10
p a <=> b # => -1

a = 10
b = 10
p a <=> b # => 0

a = 10
b = -10
p a <=> b # => 1

def compare(a, b)
  res = a <=> b
  if res 1
    puts "a > b"
  elsif res == 0
    puts "a == b"
  else
    puts "a < b"
  end
end