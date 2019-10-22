def hipsterfy(word)
  vowels = "aeiouAEIUO".split("")
  word.reverse.each_char.with_index do |char, idx|
    if vowels.include?(char)
      word[-(idx + 1)] = " "
      break
    end
  end
  word.split.join
end

def vowel_counts(str)
  res = Hash.new { |hash, key| hash[key] = 0 }
  vowels = "aeiou".split("")
  str.downcase!
  str.each_char do |char|
    if vowels.include?(char)
      res[char] += 1
    end
  end
  res
end

def caesar_cipher(message, num)
  letters  ="abcdefghijklmnopqrstuvwxyz".split("")
  message.each_char.with_index do |char, idx|
    if letters.include?(char)
      message[idx] = letters[(letters.find_index(char) + num) % letters.length]
    end
  end
end