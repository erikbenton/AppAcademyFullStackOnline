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
  end

  def receive_unmatched_card(pos, card)
    @seen_cards[card.to_s][0] << pos if !@seen_cards[card.to_s][0].include?(pos)
  end

  def receive_matched_cards(positions, card)
    @seen_cards[card.to_s] = [positions, true]
  end

  def get_guess
    # debugger
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
    guess = [rand(0...@board_length), rand(0...@board_length)]
    until !already_taken.include?(guess)
      guess = [rand(0...@board_length), rand(0...@board_length)]
    end
    return guess
  end
end