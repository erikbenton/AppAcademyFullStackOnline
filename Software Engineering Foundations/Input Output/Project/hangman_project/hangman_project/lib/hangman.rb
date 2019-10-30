require "byebug"

class Hangman

  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]

  def self.random_word
    DICTIONARY.sample
  end

  def initialize
    @secret_word = Hangman.random_word
    @guess_word = []
    @secret_word.length.times { @guess_word << "_" }
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  def guess_word
    @guess_word
  end

  def secret_word
    @secret_word
  end

  def attempted_chars
    @attempted_chars
  end

  def remaining_incorrect_guesses
    @remaining_incorrect_guesses
  end

  def already_attempted?(char)
    @attempted_chars.any? { |guess| guess == char }
  end

  def get_matching_indices(char)
    res = []
    @secret_word.each_char.with_index { |letter, idx| res << idx if char == letter }
    res
  end

  def fill_indices(char, arr)
    arr.each { |idx| @guess_word[idx] = char }
  end

  def try_guess(char)
    if self.already_attempted?(char)
      puts "that has already been attempted"
      return false
    end
    indices = self.get_matching_indices(char)
    @remaining_incorrect_guesses -= 1 if indices.empty?
    self.fill_indices(char, indices)
    @attempted_chars << char
    true
  end

  def ask_user_for_guess
    puts "Enter a char"
    user_char = gets.chomp
    self.try_guess(user_char)
  end

  def win?
    if @guess_word.join("") == @secret_word
      puts "WIN"
      return true
    end
    false
  end

  def lose?
    if @remaining_incorrect_guesses <= 0
      puts "LOSE"
      return true
    end
    false
  end

  def game_over?
    if self.win? or self.lose?
      puts @secret_word
      return true
    end
    false
  end

end