require_relative "06_min_max_stack_queue"

# O(n) Optimized solution
def max_windowed_range(array, window_size)
  queue = MinMaxStackQueue.new
  best_range = nil

  array.each_with_index do |el, i|
    queue.enqueue(el)
    queue.dequeue if queue.size > window_size

    if queue.size == window_size
      current_range = queue.max - queue.min
      best_range = current_range if !best_range || current_range > best_range
    end
  end

  best_range
end

def windowed_max_range_slow(arr, size)
  current_max_range = nil
  (0..(arr.length - size)).to_a.each do |idx|
    window = arr[idx...(idx + size)]
    max = window.max
    min = window.min
    diff = max - min
    current_max_range = diff if current_max_range.nil? || diff > current_max_range
  end
  current_max_range
end

if __FILE__ == $PROGRAM_NAME
  p max_windowed_range([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
  p max_windowed_range([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
  p max_windowed_range([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
  p max_windowed_range([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8
  arr = (0..1000000).to_a.shuffle!
  puts "Go!"
  p max_windowed_range(arr, 5)
  # puts windowed_max_range_slow(arr, 5)
end
