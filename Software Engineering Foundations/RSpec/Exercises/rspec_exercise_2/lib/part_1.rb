def partition(arr, num)
  smaller = arr.select { |ele| ele < num }
  larger = arr.select { |ele| ele >= num }
  [smaller, larger]
end

def merge(hash_1, hash_2)
  res = hash_1.dup
  hash_2.each { |key, val| res[key] = val }
  res
end

def censor(sentence, curse_words)
  vowels = "aeiou".split("")
  words = sentence.split.map do |word|
    if curse_words.include?(word.downcase)
      word.each_char.with_index do |char, idx|
        if vowels.include?(char.downcase)
          word[idx] = "*"
        end
      end
    end
    word
  end
  words.join(" ")
end

def power_of_two?(num)
  power = 1
  while power < num
    power *= 2
  end
  power == num
end