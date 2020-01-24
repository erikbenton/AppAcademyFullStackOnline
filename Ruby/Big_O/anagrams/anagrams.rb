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
# puts second_anagram?("godzillaaa", "gdozillaaa")