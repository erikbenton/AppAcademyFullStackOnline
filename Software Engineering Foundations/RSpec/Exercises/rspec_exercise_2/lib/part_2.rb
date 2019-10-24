def palindrome?(str)
  idx = 0
  while idx < str.length/2
    return false if str[idx] != str[-(1 + idx)]
    idx += 1
  end
  true
end

def substrings_me(str)
  res = []
  str.each_char.with_index do |char, idx1|
    idx2 = idx1
    while idx2 < str.length
      res << str[idx1..idx2]
      idx2 += 1
    end
  end
  res
end

def substrings(str)
  res = []
  (0...str.length).each do |idx1|
    (idx1...str.length).each do |idx2|
      res << str[idx1..idx2]
    end
  end
  res
end

def palindrome_substrings(str)
  substrings(str).select { |sub_str| palindrome?(sub_str) && sub_str.length > 1 }
end