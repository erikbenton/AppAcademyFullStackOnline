def first_anagram?(first_word, second_word)
  permutations = first_word.split("").permutation(first_word.length)
  words = permutations.map { |word| word.join }
  words.include?(second_word)
end

puts first_anagram?("gizmo", "sally")
puts first_anagram?("lives", "elvis")