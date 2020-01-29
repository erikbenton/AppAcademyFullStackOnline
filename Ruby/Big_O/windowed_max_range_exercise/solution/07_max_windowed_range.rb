require_relative "06_min_max_stack_queue"
require "benchmark"

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

  arr_1 = (0...10000).to_a.shuffle!
  arr_2 = (0...100000).to_a.shuffle!
  arr_3 = (0...1000000).to_a.shuffle!
  Benchmark.bm do |x|
    x.report("fast:") { max_windowed_range(arr_1, 3) }
    x.report("slow:") { windowed_max_range_slow(arr_1, 3) }
    x.report("fast:") { max_windowed_range(arr_2, 3) }
    x.report("slow:") { windowed_max_range_slow(arr_2, 3) }
    x.report("fast:") { max_windowed_range(arr_3, 3) }
    x.report("slow:") { windowed_max_range_slow(arr_3, 3) }
  end
end
