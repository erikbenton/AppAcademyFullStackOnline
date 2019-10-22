cat1 = "cat1"
cat2 = cat1
p cat1
p cat2
puts "======"
cat2[-1] = "2"
p cat1
p cat2
puts "======"
cat1 = "cat1"
cat2 = cat1.dup
p cat1
p cat2
puts "======"
cat2[-1] = "2"
p cat1
p cat2
puts "======"

arr = []
p arr
# Or
arr = Array.new(3)
p arr
arr = Array.new(10, "?")
p arr
grid = Array.new(3, Array.new(3))
p grid
grid[0][0] = "x"
p grid
grid = Array.new(3) { Array.new(3) }
grid[0][0] = "x"
p grid