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

list = [5, 3, -7]
largest_contiguous_subsum(list) # => 8

list = [2, 3, -6, 7, -6, 7]
largest_contiguous_subsum(list) # => 8 (from [7, -6, 7])

list = [-5, -1, -3]
largest_contiguous_subsum(list) # => -1 (from [-1])