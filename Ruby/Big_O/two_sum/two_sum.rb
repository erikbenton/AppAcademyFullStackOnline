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
    res = arr.bsearch_index { |ele| ele <=> target - num }
    return true if res != nil && idx != res
  end
  false
end

puts okay_two_sum?(arr, 6) # => should be true
puts okay_two_sum?(arr, 10) # => should be false

# 1) The lower bound on the time complexity is now ALWAYS at least
#   whatever the time complexity is for the sort function (O(nln(n)))
# 2) Because the data is sorted, I can use much faster ways of finding the
#   sum since I can binary search for the "other half" of the sum

def better_two_sum(arr, target)
  sum_hash = Hash.new { |h, k| h[k] = [nil, nil] }
  arr.each_with_index do |ele, idx|
    sum_hash[ele] = [target - ele, idx]
  end
  sum_hash.each do |k, v|
    if sum_hash.has_key?(v[0])
      return true if v[1] != sum_hash[v[0]][1]
    end
  end
  false
end

puts better_two_sum(arr, 6) # => should be true
puts better_two_sum(arr, 10) # => should be false

# This is time complexity O(n) because it loops straight through the initial
# array storing them in a hash. This then goes over the hash "linearly" in O(n)
# time (Hash#has_key? runs in ~O(1)). So O(n) + O(n) => O(2n) => O(n)