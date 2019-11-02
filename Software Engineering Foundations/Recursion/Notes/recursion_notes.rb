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

count_down(9)
p factorial(5)