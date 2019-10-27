array = [1,2,3]

p array.map { |num| num * 2 }
# VS
my_proc = Proc.new { |num| num * 2 }
p my_proc
p my_proc.call(3)

my_proc = Proc.new { |a, b| a + b }
p my_proc.call(10, 9)

# Old way

def add_and_proc(num_1, num_2, prc)
  sum = num_1 + num_2
  prc.call(sum)
end

doubler = Proc.new { |num| num * 2 }
negate = Proc.new { |num| num * -1 }
# p add_and_proc(1, 2, doubler)
# p add_and_proc(1, 2, negate)

# New way

def add_and_proc(num_1, num_2, &prc)
  sum = num_1 + num_2
  prc.call(sum)
end

doubler = Proc.new { |num| num * 2 }
negate = Proc.new { |num| num * -1 }
p add_and_proc(1, 2) { |num| num * 2 }
p add_and_proc(1, 2) { |num| num * -1 }
p add_and_proc(1, 2, &doubler)
p add_and_proc(1, 2, &negate)

def my_map(arr, &prc)
  new_arr = []
  arr.each { |ele| new_arr << prc.call(ele)}
  new_arr
end

p my_map([2, 3, 4]) { |num| num * 2 }