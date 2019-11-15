def proper_factors(num)
  res = []
  (1...num).to_a.reverse.each do |div|
    res << div if num % div == 0
  end
  res
end

def aliquot_sum(num)
  factors = proper_factors(num)
  sum = factors.sum
  sum
end

def perfect_number?(num)
  num == aliquot_sum(num)
end

def ideal_numbers(n)
  count = 0
  current = 0
  res = []
  until count >= n
    current += 1
    if perfect_number?(current)
      res << current
      count += 1
    end
  end
  res
end