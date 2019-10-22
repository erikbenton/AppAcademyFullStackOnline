# Write a method, compress_str(str), that accepts a string as an arg.
# The method should return a new str where streaks of consecutive characters are compressed.
# For example "aaabbc" is compressed to "3a2bc".

def compress_str(str)
  res = ""
  count = 0
  (0...str.length - 1).each do |idx|
    if str[idx] != str[idx + 1]
      if count > 0
        sub_res = (count + 1).to_s + str[idx]
        res += sub_res
      else
        res += str[idx]
      end
      count = 0
    else
      count += 1
    end
  end
  if count > 0
    sub_res = (count + 1).to_s + str[-1]
    res += sub_res
  else
    res += str[-1]
  end
  return res
end

def compress_str(str)
  compressed = "" # Create result variable
  i = 0 # Create indexer
  # Use a while loop to control iterations
  while i < str.length 
    char = str[i]
    count = 0
    while char == str[i]
      count += 1
      i += 1
    end
    if count < 2
      compressed += char
    else
      compressed += count.to_s + char
    end
  end
  compressed
end

p compress_str("aaabbc")        # => "3a2bc"
p compress_str("xxyyyyzz")      # => "2x4y2z"
p compress_str("qqqqq")         # => "5q"
p compress_str("mississippi")   # => "mi2si2si2pi"
