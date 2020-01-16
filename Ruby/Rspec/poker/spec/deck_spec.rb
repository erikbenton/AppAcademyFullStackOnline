require "deck"

describe Deck do
  subject(:deck) { Deck.new }
  describe "#initialize" do
    it "starts with 52 cards" do
      expect(deck.cards.length).to eq(52)
    end

    it "has all unique cards" do
      spades = (deck.cards.select { |card| card.suit = :spade }).uniq { |card| card.value }
      clubs = (deck.cards.select { |card| card.suit = :club }).uniq { |card| card.value }
      hearts = (deck.cards.select { |card| card.suit = :heart }).uniq { |card| card.value }
      diamonds = (deck.cards.select { |card| card.suit = :diamond }).uniq { |card| card.value }
      expect(spades.length).to eq(13)
      expect(clubs.length).to eq(13)
      expect(hearts.length).to eq(13)
      expect(diamonds.length).to eq(13)
    end

    it "has cards with values between 1 and 13" do
      expect(deck.cards.all? { |card| card.value.between?(1,13) }).to eq(true)
    end

    it "calls #shuffle_deck" do
      expect_any_instance_of(Deck).to receive(:shuffle_deck).with(no_args)
      tdeck = Deck.new
    end
  end

  describe "#shuffle_deck" do
    it "randomly shuffles the cards in the deck" do
      temp_cards = deck.cards.dup
      deck.shuffle_deck
      expect(temp_cards != deck.cards).to eq(true)
    end
  end
end