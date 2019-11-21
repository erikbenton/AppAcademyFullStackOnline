require "byebug"
class Player
  def initialize(name)
    @name = name
  end

  def get_guess
    puts "Enter a position on the board (e.g. - 1,2)"
    guess = gets.chomp
    guess = guess.split(",").map! { |ele| ele.strip.to_i}
    guess
  end
end

class ComputerPlayer < Player
  def initialize(name, board_length)
    super(name)
    @board_length = board_length
    @seen_cards = Hash.new { |h,k| h[k] = [[], false]}
    @next_guess = []
    @previous_guess = []
  end

  def receive_unmatched_card(pos, card)
    @seen_cards[card.to_s][0] << pos if !@seen_cards[card.to_s][0].include?(pos)
  end

  def receive_matched_cards(positions, card)
    @seen_cards[card.to_s] = [positions, true]
  end

  def get_guess
    if !@next_guess.empty?
      guess = @next_guess
      @next_guess = []
      return guess
    end
    quick_matches = []
    already_taken = []
    @seen_cards.each do |k, v|
      been_seen = v[1]
      pos = v[0]
      already_taken += pos if been_seen
      quick_matches += pos if !been_seen and pos.length > 1
    end
    if quick_matches.length > 1
      @next_guess = quick_matches[1]
      return quick_matches[0]
    end
    already_guessed = self.get_already_guessed
    guess = self.make_guess
    until self.valid_guess?(already_taken, already_guessed, guess)
      guess = self.make_guess
    end
    self.update_previous_guess(guess)
    return guess
  end

  def get_already_guessed
    already_guessed = []
    @seen_cards.each do |k, v|
      already_guessed += v[0]
    end
    already_guessed
  end

  def valid_guess?(already_taken, already_guessed, guess)
    valid = true
    valid &= !already_taken.include?(guess)
    valid &= !already_guessed.include?(guess)
    valid &= (guess != @previous_guess)
    valid
  end

  def make_guess
    [rand(0...@board_length), rand(0...@board_length)]
  end

  def update_previous_guess(guess)
    if @previous_guess.empty?
      @previous_guess = guess
    else
      @previous_guess = []
    end
  end
end