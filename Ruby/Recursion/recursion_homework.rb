def sum_to(n)
  return nil if n < 0
  return n if n == 0
  n + sum_to(n - 1)
end

# Test Cases
puts
puts "sum_to"
puts
p "#{sum_to(5)} => #{15}"
p "#{sum_to(1)} => #{1}"
p "#{sum_to(9)} => #{45}"
p "#{sum_to(-8)} => #{nil}"

puts
puts "==========="
puts

def add_numbers(arr)
  return arr[0] if arr.length <= 1
  arr[0] + add_numbers(arr[1..-1])
end

# Test Cases
puts
puts "add_numbers"
puts
p "#{add_numbers([1,2,3,4])} => #{10}"
p "#{add_numbers([3])} => #{3}"
p "#{add_numbers([-80,34,7])} => #{-39}"
p "#{add_numbers([])} => #{nil}"

puts
puts "==========="
puts

def gamma_fnc(n)
  return nil if n < 1
  return 1 if n == 1
  (n - 1) * gamma_fnc(n - 1)
end

# Test Cases
puts
puts "gamma_fcn"
puts
p "#{gamma_fnc(0)}  => #{nil}"
p "#{gamma_fnc(1)}  => #{1}"
p "#{gamma_fnc(4)}  => #{6}"
p "#{gamma_fnc(8)}  => #{5040}"

puts
puts "==========="
puts

def ice_cream_shop(flavors, favorite)
  return false if flavors.empty?
  return true if flavors.first == favorite
  ice_cream_shop(flavors[1..-1], favorite)
end

# Test Cases
puts
puts "ice_cream_shop"
puts
p "#{ice_cream_shop(['vanilla', 'strawberry'], 'blue moon')}  => #{false}"
p "#{ice_cream_shop(['pistachio', 'green tea', 'chocolate', 'mint chip'], 'green tea')} => #{true}"
p "#{ice_cream_shop(['cookies n cream', 'blue moon', 'superman', 'honey lavender', 'sea salt caramel'], 'pistachio')} => #{false}"
p "#{ice_cream_shop(['moose tracks'], 'moose tracks')}  => #{true}"
p "#{ice_cream_shop([], 'honey lavender')}  => #{false}"

puts
puts "==========="
puts

def reverse(str)
  return str if str.length <= 1
  str[-1] + reverse(str[0...-1])
end

# Test Cases
puts
puts "reverse"
puts
p "#{reverse("house")} => #{"esuoh"}"
p "#{reverse("dog")} => #{"god"}"
p "#{reverse("atom")} => #{"mota"}"
p "#{reverse("q")} => #{"q"}"
p "#{reverse("id")} => #{"di"}"
p "#{reverse("")} => #{""}"