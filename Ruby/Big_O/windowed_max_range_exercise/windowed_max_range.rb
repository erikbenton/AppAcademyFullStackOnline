require "byebug"
require_relative "min_max_stack_queue.rb"

# def windowed_max_range(arr, size)
#   current_max_range = nil
#   (0..(arr.length - size)).to_a.each do |idx|
#     window = arr[idx...(idx + size)]
#     max = window.max
#     min = window.min
#     diff = max - min
#     current_max_range = diff if current_max_range.nil? || diff > current_max_range
#   end
#   current_max_range
# end

def windowed_max_range(arr, size)
  current_max_range = nil
  stack_queue = MinMaxStackQueue.new
  arr[0...size-1].each do |val|
    stack_queue.enqueue(val)
  end
  ((size-1)...(arr.length)).to_a.each do |idx|
    stack_queue.enqueue(arr[idx])
    diff = stack_queue.max - stack_queue.min
    current_max_range = diff if current_max_range.nil? || diff > current_max_range
    stack_queue.dequeue
  end
  current_max_range
end

puts windowed_max_range([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
puts windowed_max_range([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
puts windowed_max_range([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
puts windowed_max_range([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8