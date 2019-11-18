# Write a method strange_sums that accepts an array of numbers as an argument.
# The method should return a count of the number of distinct pairs of elements
# that have a sum of zero. You may assume that the input array contains unique
# elements.
def strange_sums(arr)
  count = 0
  arr.each do |num|
    if num > 0 and arr.include?(-num)
      count += 1
    end
  end
  count
end

# Examples
puts "strange_sums"
p "#{strange_sums([2, -3, 3, 4, -2])} => #{2}"
p "#{strange_sums([42, 3, -1, -42])} => #{1}"
p "#{strange_sums([-5, 5])} => #{1}"
p "#{strange_sums([19, 6, -3, -20])} => #{0}"
p "#{strange_sums([9])} => #{0}"
puts

# Write a method pair_product that accepts an array of numbers and a product
# as arguments. The method should return a boolean indicating whether or not a
# pair of distinct elements in the array result in the product when multiplied
# together. You may assume that the input array contains unique elements.
def pair_product(arr, prod)
  arr.each_with_index do |num_1, idx_1|
    (idx_1 + 1...arr.length).each do |idx_2|
      num_2 = arr[idx_2]
      return true if num_1 * num_2 == prod
    end
  end
  false
end

# Examples
puts "pair_product"
p "#{pair_product([4, 2, 5, 8], 16)} => #{true}"
p "#{pair_product([8, 1, 9, 3], 8)} => #{true}"
p "#{pair_product([3, 4], 12)} => #{true}"
p "#{pair_product([3, 4, 6, 2, 5], 12)} => #{true}"
p "#{pair_product([4, 2, 5, 7], 16)} => #{false}"
p "#{pair_product([8, 4, 9, 3], 8)} => #{false}"
p "#{pair_product([3], 12)} => #{false}"
puts

# Write a method rampant_repeats that accepts a string and a hash as arguments.
# The method should return a new string where characters of the original string
# are repeated the number of times specified by the hash. If a character does
# not exist as a key of the hash, then it should remain unchanged.
def rampant_repeats(str, hash)
  new_str = ""
  str.each_char do |char|
    num_times = 1
    if hash.has_key?(char)
      num_times = hash[char]
    end
    num_times.times { new_str += char }
  end
  new_str
end

puts "rampant_repeats"
p "#{rampant_repeats('taco', {'a'=>3, 'c'=>2})} => taaacco"
p "#{rampant_repeats('feverish', {'e'=>2, 'f'=>4, 's'=>3})} => ffffeeveerisssh"
p "#{rampant_repeats('misispi', {'s'=>2, 'p'=>2})} => mississppi"
p "#{rampant_repeats('faarm', {'e'=>3, 'a'=>2})} => faaaarm"
puts

# Write a method perfect_square? that accepts a number as an argument. The
# method should return a boolean indicating whether or not the argument is a
# perfect square. A perfect square is a number that is the product of some
# number multiplied by itself. For example, since 64 = 8 * 8 and 144 = 12 * 12,
# 64 and 144 are perfect squares; 35 is not a perfect square.
def perfect_square?(num)
  factor = 1
  while factor * factor < num
    factor += 1
  end
  factor * factor == num
end

puts "rampant_repeats"
p "#{perfect_square?(1)} => #{true}"
p "#{perfect_square?(4)} => #{true}"
p "#{perfect_square?(64)} => #{true}"
p "#{perfect_square?(100)} => #{true}"
p "#{perfect_square?(169)} => #{true}"
p "#{perfect_square?(2)} => #{false}"
p "#{perfect_square?(40)} => #{false}"
p "#{perfect_square?(32)} => #{false}"
p "#{perfect_square?(50)} => #{false}"
puts