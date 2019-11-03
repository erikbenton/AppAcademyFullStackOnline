# Write a method, all_vowel_pairs, that takes in an array of words and returns all pairs of words
# that contain every vowel. Vowels are the letters a, e, i, o, u. A pair should have its two words
# in the same order as the original array. 
#
# Example:
#
# all_vowel_pairs(["goat", "action", "tear", "impromptu", "tired", "europe"])   # => ["action europe", "tear impromptu"]
# def all_vowel_pairs(words)
#   res = []
#   vowels = "aeiou".split("")
#   (0...words.length).each do |idx_1|
#     word_1 = words[idx_1]
#     already_seen = word_1.split("").select { |char| vowels.include?(char) }
#     ((idx_1 + 1)...words.length).each do |idx_2|
#       word_2 = words[idx_2]
#       total_seen = already_seen + word_2.split("").select { |char| vowels.include?(char) }
#       res << "#{word_1} #{word_2}" if vowels.all? { |char| total_seen.include?(char) }
#     end
#   end
#   res
# end

def all_vowel_pairs(words)
  res = []
  vowels = "aeiou".split("")
  (0...words.length).each do |idx_1|
    word_1 = words[idx_1]
    ((idx_1 + 1)...words.length).each do |idx_2|
      word_2 = words[idx_2]
      new_str = "#{word_1} #{word_2}"
      res << new_str if vowels.all? { |char| new_str.include?(char) }
    end
  end
  res
end


# Write a method, composite?, that takes in a number and returns a boolean indicating if the number
# has factors besides 1 and itself
#
# Example:
#
# composite?(9)     # => true
# composite?(13)    # => false
def composite?(num)
  (2...num).any? { |div| num % div == 0 }
end


# A bigram is a string containing two letters.
# Write a method, find_bigrams, that takes in a string and an array of bigrams.
# The method should return an array containing all bigrams found in the string.
# The found bigrams should be returned in the the order they appear in the original array.
#
# Examples:
#
# find_bigrams("the theater is empty", ["cy", "em", "ty", "ea", "oo"])  # => ["em", "ty", "ea"]
# find_bigrams("to the moon and back", ["ck", "oo", "ha", "at"])        # => ["ck", "oo"]
def find_bigrams(str, bigrams)
  bigrams.select { |bigram| str.include?(bigram) }
end

class Hash
    # Write a method, Hash#my_select, that takes in an optional proc argument
    # The method should return a new hash containing the key-value pairs that return
    # true when passed into the proc.
    # If no proc is given, then return a new hash containing the pairs where the key is equal to the value.
    #
    # Examples:
    #
    # hash_1 = {x: 7, y: 1, z: 8}
    # hash_1.my_select { |k, v| v.odd? }          # => {x: 7, y: 1}
    #
    # hash_2 = {4=>4, 10=>11, 12=>3, 5=>6, 7=>8}
    # hash_2.my_select { |k, v| k + 1 == v }      # => {10=>11, 5=>6, 7=>8})
    # hash_2.my_select                            # => {4=>4}
    def my_select(&prc)
      prc ||= Proc.new { |k, v| k == v }
      self.select { |k, v| prc.call(k, v) }
    end
end

class String
    # Write a method, String#substrings, that takes in a optional length argument
    # The method should return an array of the substrings that have the given length.
    # If no length is given, return all substrings.
    #
    # Examples:
    #
    # "cats".substrings     # => ["c", "ca", "cat", "cats", "a", "at", "ats", "t", "ts", "s"]
    # "cats".substrings(2)  # => ["ca", "at", "ts"]
    def substrings(length = nil)
      res = []
      (0...(self.length)).each do |idx_1|
        if length
          new_str = self[idx_1...(idx_1 + length)]
          if new_str.length == length
            res << self[idx_1...(idx_1 + length)]
          end
        else
          new_str = self[idx_1]
          res << new_str
          ((idx_1 + 1)...self.length).each do |idx_2|
            new_str += self[idx_2]
            res << new_str
          end
        end
      end
      res
    end


    # Write a method, String#caesar_cipher, that takes in an a number.
    # The method should return a new string where each char of the original string is shifted
    # the given number of times in the alphabet.
    #
    # Examples:
    #
    # "apple".caesar_cipher(1)    #=> "bqqmf"
    # "bootcamp".caesar_cipher(2) #=> "dqqvecor"
    # "zebra".caesar_cipher(4)    #=> "difve"
    def caesar_cipher(num)
      alphabet = ("a".."z").to_a
      res = self.split("").map do |char|
        if alphabet.include?(char)
          idx = alphabet.find_index(char)
          idx = (idx + num) % 26
          alphabet[idx]
        else
          char
        end
      end
      res.join("")
    end
end