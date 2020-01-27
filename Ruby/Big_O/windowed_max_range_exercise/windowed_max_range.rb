require "byebug"

def windowed_max_range(arr, size)
  current_max_range = nil
  current_max_window = []
  (0..(arr.length - size)).to_a.each do |idx|
    window = arr[idx...(idx + size)]
    max = window.max
    min = window.min
    diff = max - min
    current_max_range = diff if current_max_range.nil? || diff > current_max_range
  end
  current_max_range
end

puts windowed_max_range([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
puts windowed_max_range([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
puts windowed_max_range([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
puts windowed_max_range([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8