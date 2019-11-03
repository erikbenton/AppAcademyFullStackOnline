def recursive_hello
  puts "Hello =)"
  recursive_hello
end

def count_down(n)
  if n > 0 # End case
    puts n
    count_down(n - 1) # Recursive call on smaller problem
  end
end

def factorial(num)
  return 1 if num == 0
  num * factorial(num - 1)
end

def fibonacci(n)
  return 0 if n <= 0
  return 1 if n <= 2
  fibonacci(n - 1) + fibonacci(n - 2)
end

count_down(9)
p factorial(5)
puts fibonacci(1) # => 1
puts fibonacci(2) # => 1
puts fibonacci(3) # => 2
puts fibonacci(4) # => 3
puts fibonacci(5) # => 5
puts fibonacci(6) # => 8
puts fibonacci(7) # => 13