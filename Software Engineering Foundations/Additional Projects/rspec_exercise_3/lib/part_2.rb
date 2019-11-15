def element_count(arr)
  res = Hash.new { |h, k| h[k] = 0 }
  arr.each { |val| res[val] += 1 }
  res
end

def char_replace!(str, hash)
  str.each_char.with_index do |char, idx|
    if hash.has_key?(char)
      str[idx] = hash[char]
    end
  end
  str
end

def product_inject(arr)
  arr.inject { |prod, num| prod *= num }
end