def hipsterfy_me(word)
  vowels = "aeiouAEIUO".split("")
  word.reverse.each_char.with_index do |char, idx|
    if vowels.include?(char)
      word[-(idx + 1)] = " "
      break
    end
  end
  word.split.join
end

# After watching the solutions
def hipsterfy(word)
  vowels = "aeiouAEIUO".split("")
  idx = word.length - 1
  while idx >= 0
    if vowels.include?(word[idx])
      return word[0...idx] + word[idx + 1..-1]
    end
    idx -= 1
  end
  word
end

def vowel_counts(str)
  res = Hash.new { |hash, key| hash[key] = 0 }
  vowels = "aeiou".split("")
  str.each_char do |char|
    res[char.downcase] += 1 if vowels.include?(char.downcase)
  end
  res
end

def caesar_cipher_me(message, num)
  letters = "abcdefghijklmnopqrstuvwxyz".split("")
  message.each_char.with_index do |char, idx|
    if letters.include?(char)
      message[idx] = letters[(letters.find_index(char) + num) % letters.length]
    end
  end
end

def caesar_cipher(message, num)
  letters = ("a".."z").to_a
  new_message = ""
  message.each_char do |char, idx|
    if letters.include?(char)
      new_message += letters[(letters.find_index(char) + num) % letters.length]
    else
      new_message += char
    end
  end
  new_message
end