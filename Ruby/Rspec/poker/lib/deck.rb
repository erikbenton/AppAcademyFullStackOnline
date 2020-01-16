require_relative "card"

class Deck
  attr_accessor :cards

  def initialize
    suits = [:spade, :club, :heart, :diamond]
    values = (1..13).to_a
    @cards = []
    suits.each do |suit|
      values.each do |val|
        @cards << Card.new(val, suit)
      end
    end
    shuffle_deck
  end

  def shuffle_deck
    @cards.shuffle!
  end
end