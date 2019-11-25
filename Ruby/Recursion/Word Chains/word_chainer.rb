require "byebug"
class WordChainer

  def self.get_dictionary(dictionary_file_name)
    file_data = File.open(dictionary_file_name).readlines.map(&:chomp)
    file_data
  end

  def initialize(dictionary_file_name)
    @dictionary = WordChainer.get_dictionary(dictionary_file_name)
    @current_words = []
    @all_seen_words = []
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

  def run(source, target)
    @current_words = [source]
    @all_seen_words = [source]
    until @current_words.empty?# or @current_words.include?(target)
      new_current_words = self.explore_current_words
      new_current_words.each { |word| puts word }
      @current_words = new_current_words
    end
  end

  def explore_current_words
    new_current_words = []
    @current_words.each do |current_word|
      adjacents = self.adjacent_words(current_word)
      adjacents.each do |word|
        if !@all_seen_words.include?(word)
          new_current_words << word
          @all_seen_words << word
        end
      end
    end
    new_current_words
  end

end

if __FILE__ == $PROGRAM_NAME
  word_chain = WordChainer.new("./dictionary.txt")
  word_chain.run("duck", "ruby")
end