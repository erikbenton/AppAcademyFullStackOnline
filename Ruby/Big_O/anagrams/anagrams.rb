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