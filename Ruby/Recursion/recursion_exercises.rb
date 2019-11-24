require "byebug"
def range(start, stop)
  return nil if stop < start
  return [] if stop == start
  [start] + range(start + 1, stop)
end

p range(1,5)
p range(1,1)
p range(1,-1)
p range(-10, 59)
puts

def recursive_sum_arr(arr)
  return nil if arr.empty?
  return arr[0] if arr.length == 1
  arr[0] + recursive_sum_arr(arr[1..-1])
end

def iterative_sum_arr(arr)
  # arr.sum
  # sum = arr.inject { |acc, el| acc += el }
  # sum
  return nil if arr.empty?
  sum = 0
  arr.each { |el| sum += el }
  sum
end

p recursive_sum_arr([1,2,3])
p recursive_sum_arr([3,3,3])
p recursive_sum_arr([-1,0,1])
p iterative_sum_arr([1,2,3])
p iterative_sum_arr([3,3,3])
p iterative_sum_arr([-1,0,1])
puts

def exp_1(b, n)
  return nil if n < 0
  return 1 if n == 0
  b * exp_1(b, n - 1)
end

def exp_2(b, n)
  return nil if n < 0
  return 1 if n == 0
  return b if n == 1
  if n.even?
    exp_2(b, n / 2) ** 2
  else
    b * (exp_2(b, (n - 1) / 2) ** 2)
  end
end

p exp_1(0,0)
p exp_1(2,25)
p exp_1(3,25)
p exp_2(0,0)
p exp_2(2,25)
p exp_2(3,25)
puts

def deep_dup(arr)
  new_arr = []
  arr.each do |el|
    if el.is_a?(Array)
      new_arr << deep_dup(el)
    else
      new_arr << el
    end
  end
  new_arr
end

robot_parts = ["nuts", "bolts", ["washers"]]
robot_parts = [
  ["nuts", "bolts", "washers"],
  ["capacitors", "resistors", "inductors"]
]
robot_parts_copy = deep_dup(robot_parts)
robot_parts_copy[1] << "LEDs"
p robot_parts[1]

arr = [1, [2], [3, [4]]]
arr_copy = deep_dup(arr)
arr_copy[-1] << "X"
p arr[-1]
p arr_copy[-1]

def rec_fibonacci(n)
  return [] if n <= 0
  return [1] if n == 1
  return [1, 1] if n == 2
  first = rec_fibonacci(n - 2)
  second = rec_fibonacci(n - 1)
  current_number = [first[-1] + second[-1]]
  rec_fibonacci(n - 1) + current_number
end

def itr_fibonacci(n)
  res = []
  while n > 0
    if res.length < 2
      res << 1
    else
      res << res[-1] + res[-2]
    end
    n -= 1
  end
  res
end

# 1,1,2,3,5,8
p rec_fibonacci(10)
p itr_fibonacci(10)
puts

def bsearch(arr, num)
  return nil if arr.length <= 1 and arr[0] != num
  idx = arr.length / 2
  return idx if arr[idx] == num
  if arr[idx] > num
    res = bsearch(arr[0...idx], num)
  else
    res_idx = bsearch(arr[idx..-1], num)
    return nil if !res_idx
    res = idx + res_idx
  end
  res
end

p bsearch([1, 2, 3], 1) # => 0
p bsearch([2, 3, 4, 5], 3) # => 1
p bsearch([2, 4, 6, 8, 10], 6) # => 2
p bsearch([1, 3, 4, 5, 9], 5) # => 3
p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil
puts

def merge_sort(arr)
  return arr if arr.length <= 1
  mid = arr.length / 2
  merge(merge_sort(arr[0...mid]), merge_sort(arr[mid..-1]))
end

def merge(arr_1, arr_2)
  idx_1 = 0
  idx_2 = 0
  res = []
  while res.length < arr_1.length + arr_2.length
    if arr_1[idx_1] <= arr_2[idx_2]
      res << arr_1[idx_1]
      idx_1 += 1
    else
      res << arr_2[idx_2]
      idx_2 += 1
    end
    if idx_1 == arr_1.length
      res += arr_2[idx_2..-1]
      break
    end
    if idx_2 == arr_2.length
      res += arr_1[idx_1..-1]
      break
    end
  end
  res
end
arr = (1..30).to_a.shuffle!
p arr
p merge_sort(arr)
puts

def subsets(arr)
  return [[]] if arr.empty?
  previous_sets = subsets(arr.drop(1))
  new_sets = previous_sets.map { |set| [arr.first] + set }
  previous_sets + new_sets
end

p subsets([]) # => [[]]
p subsets([1]) # => [[], [1]]
p subsets([1, 2]) # => [[], [1], [2], [1, 2]]
p subsets([1, 2, 3]) # => [[], [1], [2], [1, 2], [3], [1, 3], [2, 3], [1, 2, 3]]
p subsets([1, 2, 3, 4])
puts

def permutations(arr)
  return arr if arr.length == 1
  if arr.length == 2
    return [[arr[0], arr[1]], [arr[1], arr[0]]]
  end
  res = []
  arr.each_with_index do |el, idx|
    tester = arr[0...idx] + arr[idx+1..-1]
    new_permutes = permutations(arr[0...idx] + arr[idx+1..-1])
    res += new_permutes.map { |el| el << arr[idx] }
  end
  res
end

p permutations([1, 2, 3])
puts
p permutations([1, 2, 3, 4])
puts

def greedy_make_change(num, arr=[25, 10, 5, 1])
  return [] if num == 0
  return [arr[-1]] if num == 1
  coin = []
  idx = 0
  while idx < arr.length
    if num >= arr[idx]
      coin << arr[idx]
      break
    end
    idx += 1
  end
  coin += greedy_make_change(num - arr[idx], arr)
end

p greedy_make_change(39)
p greedy_make_change(50)
p greedy_make_change(24, [10,7,1])
puts

def make_better_change(num, arr=[25, 10, 5, 1])
  return [] if num == 0
  return [arr[-1]] if num == 1
  coin = []
  idx = 0
  while idx < arr.length
    if num >= arr[idx]
      coin << arr[idx]
      break
    end
    idx += 1
  end
  new_purse = arr[idx..-1]
  debugger if !coin or !num or !arr or !new_purse
  if !new_purse.is_a?(Array)
    new_purse = arr[-1]
  end
  coin += make_better_change(num - arr[idx], new_purse)
end

p make_better_change(39)
p make_better_change(50)
p make_better_change(24, [10,7,1])
puts

def make_change(num, coins=[25, 10, 5, 1])
  total_combos = []
  coins.each_with_index do |coin, idx|
    combos = greedy(num - coin, coins[idx..-1])
    combos.map! { |sub_change| sub_change + [coin] }
    total_combos += change
  end
  total_combos
end

p make_change(39)
p make_change(50)
p make_change(14, [10,7,1])
puts

def greedy(num, coins)
  change = []
  return change if num < 1
  if coins.length == 1 # and coins[0] == 1
    num.times do
      change << 1
    end
    return change
  end
  coin = coins.first
  if num > coin
    change << coin
    return change + greedy(num - coin, coins)
  else
    return change + greedy(num, coins[1..-1])
  end
end

def purse_shift(num, coins)
end