require "byebug"
def bad_two_sum?(arr, target)
  arr.each_with_index do |num, idx_1|
    ((idx_1+1)...arr.length).to_a.each do |idx_2|
      return true if num + arr[idx_2] == target
    end
  end
  false
end

arr = [0, 1, 5, 7]
puts bad_two_sum?(arr, 6) # => should be true
puts bad_two_sum?(arr, 10) # => should be false

# This would have a time complexity of O(n^2) because (at worst) it has 2 loops
# that will need to go n * (n + 1) / 2 steps since the outer loop will have to
# go to the second to the end (n - 1) and 

def okay_two_sum?(arr, target)
  sorted_arr = arr.sort
  arr.each_with_index do |num, idx|
    # debugger
    res = arr.bsearch_index { |ele| ele <=> target - num }
    return true if res != nil && idx != res
  end
  false
end

puts okay_two_sum?(arr, 6) # => should be true
puts okay_two_sum?(arr, 10) # => should be false