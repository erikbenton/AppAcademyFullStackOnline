def my_min(arr)
  arr.each do |min|
    return min if arr.one? { |ele| ele <= min }
  end
end

list = [ 0, 3, 5, 4, -5, 10, -10, 1, 90 ]
puts my_min(list)  # =>  -10

# This has O(n^2) time complexity since it is a loop
# in another loop, so at worst it'll have to do:
# n inner loops for n outer loops, so n * n => O(n^2)

def my_min_lin(arr)
  min = arr.first
  arr.each do |ele|
    min = ele if ele < min
  end
  min
end

puts
puts my_min_lin(list)  # =>  -10

# This is O(n) time complexity since all n elements
# Need to be looked at/compared each time
# So n steps => O(n)