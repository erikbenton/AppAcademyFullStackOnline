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