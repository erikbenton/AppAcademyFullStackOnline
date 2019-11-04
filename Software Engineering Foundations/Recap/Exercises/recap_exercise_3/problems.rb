# GENERAL PROBLEMS
# Write a method no_dupes?(arr) that accepts an array as an arg and returns an
# new array containing the elements that were not repeated in the array.
def no_dupes?(arr)
  res = []
  counter = Hash.new { |h, k| h[k] = 0 }
  arr.each { |ele| counter[ele] += 1 }
  counter.each { |k, v| res << k if v == 1 }
  res
end

# Examples
puts "no_dupes?"
p no_dupes?([1, 1, 2, 1, 3, 2, 4])         # => [3, 4]
p no_dupes?(['x', 'x', 'y', 'z', 'z'])     # => ['y']
p no_dupes?([true, true, true])            # => []
puts

# Write a method no_consecutive_repeats?(arr) that accepts an array as an arg.
# The method should return true if an element never appears consecutively in
# the array; it should return false otherwise.
def no_consecutive_repeats?(arr)
  (0...arr.length - 1).each do |i|
    return false if arr[i] == arr[i + 1]
  end
  true
end

# Examples
puts "no_consecutive_repeats?"
p no_consecutive_repeats?(['cat', 'dog', 'mouse', 'dog'])     # => true
p no_consecutive_repeats?(['cat', 'dog', 'dog', 'mouse'])     # => false
p no_consecutive_repeats?([10, 42, 3, 7, 10, 3])              # => true
p no_consecutive_repeats?([10, 42, 3, 3, 10, 3])              # => false
p no_consecutive_repeats?(['x'])                              # => true
puts

# Write a method char_indices(str) that takes in a string as an arg.
# The method should return a hash containing characters as keys.
# The value associated with each key should be an array containing the indices
# where that character is found.
def char_indices(str)
  char_index = Hash.new { |h, k| h[k] = [] }
  str.each_char.with_index do |char, i|
    char_index[char] << i
  end
  char_index
end

# Examples
puts "char_indices"
p char_indices('mississippi')   # => {"m"=>[0], "i"=>[1, 4, 7, 10], "s"=>[2, 3, 5, 6], "p"=>[8, 9]}
p char_indices('classroom')     # => {"c"=>[0], "l"=>[1], "a"=>[2], "s"=>[3, 4], "r"=>[5], "o"=>[6, 7], "m"=>[8]}
puts

# Write a method longest_streak(str) that accepts a string as an arg. The
# method should return the longest streak of consecutive characters in the
# string. If there are any ties, return the streak that occurs later in the string.
def longest_streak(str)
  streaks = []
  longest = ""
  current = ""
  str.each_char do |char|
    if char == current[-1]
      current += char
    else
      if current.length >= longest.length
        longest = current
      end
      current = char
    end
  end
  if current.length >= longest.length
    longest = current
  end
  longest
end

# Examples
puts "longest_streak"
p longest_streak('a')           # => 'a'
p longest_streak('accccbbb')    # => 'cccc'
p longest_streak('aaaxyyyyyzz') # => 'yyyyy
p longest_streak('aaabbb')      # => 'bbb'
p longest_streak('abc')         # => 'c'
puts


# Write a method bi_prime?(num) that accepts a number as an arg and returns a
# boolean indicating whether or not the number is a bi-prime. A bi-prime is a
# positive integer that can be obtained by multiplying two prime numbers.
def bi_prime?(num)
  (2..num/2).each do |div|
    if num % div == 0
      return true if prime?(num / div) && prime?(div)
    end
  end
  false
end

def prime?(num)
  (2...num).none? { |div| num % div == 0 }
end

# Examples
puts "bi_prime?"
p bi_prime?(14)   # => true
p bi_prime?(22)   # => true
p bi_prime?(25)   # => true
p bi_prime?(94)   # => true
p bi_prime?(24)   # => false
p bi_prime?(64)   # => false
puts

# Write a method vigenere_cipher(message, keys) that accepts a string and a
# key-sequence as args, returning the encrypted message. Assume that the
# message consists of only lowercase alphabetic characters.
# A Vigenere Cipher is a Caesar cipher, but instead of a single key, a
# sequence of keys is used. For example, if we encrypt "bananasinpajamas" with
# the key sequence 1, 2, 3, then the result would be "ccqbpdtkqqcmbodt"
def vigenere_cipher(message, keys)
  alpha = ("a".."z").to_a
  new_str = ""
  message.each_char.with_index do |char, idx|
    char_idx = alpha.index(char)
    char_idx = (char_idx + keys[idx % keys.length]) % 26
    new_str += alpha[char_idx]
  end
  new_str
end

# Examples
puts "vigenere_cipher"
p vigenere_cipher("toerrishuman", [1])        # => "upfssjtivnbo"
p vigenere_cipher("toerrishuman", [1, 2])     # => "uqftsktjvobp"
p vigenere_cipher("toerrishuman", [1, 2, 3])  # => "uqhstltjxncq"
p vigenere_cipher("zebra", [3, 0])            # => "ceerd"
p vigenere_cipher("yawn", [5, 1])             # => "dbbo"
puts


# Write a method vowel_rotate(str) that accepts a string as an arg and returns
# the string where every vowel is replaced with the vowel the appears before
# it sequentially in the original string. The first vowel of the string should
# be replaced with the last vowel.
def vowel_rotate(str)
  vowels = "aeiou"
  vowels_in_word = str.split("").select do |char|
    vowels.include?(char)
  end
  vowels_in_word.unshift(vowels_in_word.pop)
  str.each_char.with_index do |char, idx|
    str[idx] = vowels_in_word.shift if vowels.include?(char)
  end
  str
end

# Examples
puts "vowel_rotate"
p vowel_rotate('computer')      # => "cempotur"
p vowel_rotate('oranges')       # => "erongas"
p vowel_rotate('headphones')    # => "heedphanos"
p vowel_rotate('bootcamp')      # => "baotcomp"
p vowel_rotate('awesome')       # => "ewasemo"
puts

# PROC PROBLEMS
class String

  # Extend the string class by defining a String#select method that accepts a
  # block. The method should return a new string containing characters of the
  # original string that return true when passed into the block. If no block is
  # passed, then return the empty string. Do not use the built-in Array#select
  # in your solution.
  def select(&prc)
    return "" if !prc
    res = []
    self.each_char { |char| res << char if prc.call(char) }
    res.join("")
  end

  # Extend the string class by defining a String#map! method that accepts a
  # block. The method should modify the existing string by replacing every
  # character with the result of calling the block, passing in the original
  # character and it's index. Do not use the built-in Array#map or Array#map!
  # in your solution.
  def map!(&prc)
    self.each_char.with_index { |char, idx| self[idx] = prc.call(char, idx) }
  end
end

# Examples
puts "String#select"
p "app academy".select { |ch| !"aeiou".include?(ch) }   # => "pp cdmy"
p "HELLOworld".select { |ch| ch == ch.upcase }          # => "HELLO"
p "HELLOworld".select          # => ""
puts

# Examples
puts "String#map!"
word_1 = "Lovelace"
word_1.map! do |ch| 
    if ch == 'e'
        '3'
    elsif ch == 'a'
        '4'
    else
        ch
    end
end
p word_1        # => "Lov3l4c3"

word_2 = "Dijkstra"
word_2.map! do |ch, i|
    if i.even?
        ch.upcase
    else
        ch.downcase
    end
end
p word_2        # => "DiJkStRa"
puts

# RECURSIVE PROBLEMS
# Write a method multiply(a, b) that takes in two numbers
# and returns their product.
# You must solve this recursively (no loops!)
# You must not use the multiplication (*) operator
def multiply(num_1, num_2)
  return num_1 if num_2 <= 1
  num_1 + multiply(num_1, num_2 - 1)
end

# Examples
puts "multiply"
p multiply(3, 5)        # => 15
p multiply(5, 3)        # => 15
p multiply(2, 4)        # => 8
p multiply(0, 10)       # => 0
p multiply(-3, -6)      # => 18
p multiply(3, -6)       # => -18
p multiply(-3, 6)       # => -18
puts

# Write a method lucasSequence that accepts a number representing a length as
# an arg. The method should return an array containing the Lucas Sequence up
# to the given length. Solve this recursively.
def lucas_sequence(num)
  return [] if num == 0
  return [2] if num == 1
  return [2, 1] if num == 2
  lucas_sequence(num - 1) + [lucas_sequence(num - 1)[-1] + lucas_sequence(num - 1)[-2]]
end

# Examples
puts "lucas_sequence"
p lucas_sequence(0)   # => []
p lucas_sequence(1)   # => [2]    
p lucas_sequence(2)   # => [2, 1]
p lucas_sequence(3)   # => [2, 1, 3]
p lucas_sequence(6)   # => [2, 1, 3, 4, 7, 11]
p lucas_sequence(8)   # => [2, 1, 3, 4, 7, 11, 18, 29]
puts