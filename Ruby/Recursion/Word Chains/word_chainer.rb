require "byebug"
class WordChainer

  def self.get_dictionary(dictionary_file_name)
    file_data = File.open(dictionary_file_name).readlines.map(&:chomp)
    file_data
  end

  def initialize(dictionary_file_name)
    @dictionary = WordChainer.get_dictionary(dictionary_file_name)
  end

  def check_adjacent_words(word, same_length)
    match = false
    same_length.each_char.with_index do |char, idx|
      stitched_same_length = same_length[0...idx] + same_length[idx + 1..-1]
      stitched_word = word[0...idx] + word[idx + 1..-1]
      match = stitched_same_length == stitched_word
      break if match
    end
    match
  end

  def adjacent_words(word)
    same_length = @dictionary.select { |entry| entry.length == word.length }
    adjacent_arr = same_length.select do |entry|
      self.check_adjacent_words(word, entry)
    end
    adjacent_arr
  end

end

if __FILE__ == $PROGRAM_NAME
  word_chain = WordChainer.new("./dictionary.txt")
  word_chain.adjacent_words("cool")
end