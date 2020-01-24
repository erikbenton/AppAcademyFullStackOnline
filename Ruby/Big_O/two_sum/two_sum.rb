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