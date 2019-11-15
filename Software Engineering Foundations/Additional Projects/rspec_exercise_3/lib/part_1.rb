def is_prime?(num)
  return false if num < 2
  (2...num).none? { |div| num % div == 0 }
end

def nth_prime(num)
  count = 0;
  current = 0;
  until count >= num
    current += 1
    count += 1 if is_prime?(current)
  end
  current
end

def prime_range(min, max)
  res = []
  (min..max).each { |num| res << num if is_prime?(num) }
  res
end