require "byebug"
def largest_contiguous_subsum(arr)
  sub_arrays = []
  sums = []
  arr.each_with_index do |ele_1, idx|
    sub_array = []
    sub_array << ele_1
    sum = ele_1
    sub_arrays << sub_array.dup
    sums << sum
    arr[idx+1..-1].each do |ele_2|
      sub_arrays << sub_arrays[-1] + [ele_2]
      sub_array << ele_2
      sum = sum + ele_2
      sums << sum
    end
  end
  max = sums.first
  max_idx = 0
  sums.each_with_index do |sum, idx|
    if sum > max
      max = sum
      max_idx = idx
    end
  end
  puts "#{max} (from #{sub_arrays[max_idx]})"
end

# How this works
# Kadane's Algorithm keeps track of the largest sum by going through te array
# linearly, summing up the numbers as it goes. The algorithm assumes that any
# "chain" of numbers that sum to a negative number should be dropped from the
# contiguous chain since it is "removing/subtracting" from the largest sum.
# This can be seen in the line => max_ending = 0 if max_ending < 0
# If a "chain" sums to a negative number, then that chain is dropped and the
# sub_array is cinched up to the point where there is no longer a negative sum
# HOWEVER
# Kadane's algorithm only works with an array that is not only negative numbers
# There has to be one non-negative number so:
# [0, 1, -1] is valid
# [0] is valid
# [-1, -2, -3] is NOT valid
# So there is an initial O(n) check for if the numbers are all negative
# If they are, then just find the max of the array
# Both of these are additive O(n) processes, thus O(n + n) => O(n)
# Since there are always only 2 "meaningful" variables, independent of the
# input size, this would be O(1) space/memory complexity

def kadanes_algorithm(arr)
  unless arr.all? { |ele| ele < 0 }
    max_so_far = 0
    max_ending = 0
    arr.each do |ele|
      max_ending = max_ending + ele
      max_ending = 0 if max_ending < 0
      max_so_far = max_ending if max_ending > max_so_far
    end
  else
    max_so_far = arr.max
  end
  puts max_so_far
end

list = [5, 3, -7]
largest_contiguous_subsum(list) # => 8

list = [2, 3, -6, 7, -6, 7]
largest_contiguous_subsum(list) # => 8 (from [7, -6, 7])

list = [-5, -1, -3]
largest_contiguous_subsum(list) # => -1 (from [-1])

puts
puts

list = [5, 3, -7]
kadanes_algorithm(list) # => 8

list = [2, 3, -6, 7, -6, 7]
kadanes_algorithm(list) # => 8 (from [7, -6, 7])

list = [-5, -1, -3]
kadanes_algorithm(list) # => -1 (from [-1])