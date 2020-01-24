def first_anagram?(first_word, second_word)
  permutations = first_word.split("").permutation(first_word.length)
  words = permutations.map { |word| word.join }
  words.include?(second_word)
end

puts first_anagram?("gizmo", "sally")
puts first_anagram?("lives", "elvis")
# puts first_anagram?("godzaailla", "aagdozilla")

def second_anagram?(first_word, second_word)
  return false if first_word.length != second_word.length
  first = first_word.split("")
  second = second_word.split("")
  first.each do |char|
    res = second.find_index(char)
    second[res] = " " unless res.nil?
  end
  second.all? { |char| char == " "}
end

puts
puts second_anagram?("gizmo", "sally")
puts second_anagram?("lives", "elvis")
puts second_anagram?("godzillaaaaaaaa", "gdozillaaaaaaaa")

def third_anagram?(first_word, second_word)
  first = first_word.split("").sort
  second = second_word.split("").sort
  first == second
end

puts
puts third_anagram?("gizmo", "sally")
puts third_anagram?("lives", "elvis")
puts third_anagram?("godzillaaaaaaaa", "gdozillaaaaaaaa")

# Assuming that the Array#sort method in ruby is operating in O(nln(n)) time
# Complexity, then in theory the third_anagram? method could be slightly
# Faster for smaller inputs, but asymptotically the second_anagram? is faster

def fourth_anagram?(first_word, second_word)
  first_hash = Hash.new { |h, k| h[k] = 0 }
  second_hash = Hash.new { |h, k| h[k] = 0 }
  first_word.each_char do |char|
    first_hash[char] += 1
  end
  second_word.each_char do |char|
    second_hash[char] += 1
  end
  first_hash == second_hash
end

puts
puts fourth_anagram?("gizmo", "sally")
puts fourth_anagram?("lives", "elvis")
puts fourth_anagram?("godzillaaaaaaaa", "gdozillaaaaaaaa")

# This is still O(n) time complexity as the algorithm still has to
# traverse the whole strings of n characters, however it is now O(n)
# space/memory complecity as it needs 2 hashes of n length

def fifth_anagram?(first_word, second_word)
  letters_hash = Hash.new { |h, k| h[k] = 0 }
  first_word.each_char do |char|
    letters_hash[char] += 1
  end
  second_word.each_char do |char|
    letters_hash[char] -= 1
  end
  letters_hash.each do |k, v|
    return false if v != 0
  end
  true
end

puts
puts fifth_anagram?("gizmo", "sally")
puts fifth_anagram?("lives", "elvis")
puts fifth_anagram?("godzillaaaaaaaa", "gdozillaaaaaaaa")

# Similar to the fourth_anagram? method but uses half the space/memory as
# only one hash is needed now