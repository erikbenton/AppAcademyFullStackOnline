require "hand"

describe Hand do
  subect(:hand) { Hand.new }

  describe "#initialize" do
    it "starts with 0 cards" do
      expect(hand.cards.empty?).to eq(true)    
    end
  end

  describe "#calculate_hand" do
    ace_hearts = Card.new(1, :heart)
    king_hearts = Card.new(13, :heart)
    queen_hearts = Card.new(12, :heart)
    jack_hearts = Card.new(11, :heart)
    ten_hearts = Card.new(10, :heart)
    five_hearts = Card.new(5, :heart)
    three_hearts = Card.new(3, :heart)

    ace_clubs = Card.new(1, :club)
    king_clubs = Card.new(13, :club)
    queen_clubs = Card.new(12, :club)
    jack_clubs = Card.new(11, :club)
    ten_clubs = Card.new(10, :club)
    nine_clubs = Card.new(9, :club)
    eight_clubs = Card.new(8, :club)
    seven_clubs = Card.new(7, :club)
    six_clubs = Card.new(6, :club)
    five_clubs = Card.new(5, :club)
    
    five_spades = Card.new(5, :spade)
    four_spades = Card.new(4, :spade)

    eight_diamonds = Card.new(8, :diamond)
    five_diamonds = Card.new(5, :diamond)
    four_diamonds = Card.new(4, :diamond)

    it "detects a royal flush" do
      hand.cards = [king_hearts, queen_hearts, jack_hearts, ten_hearts, ace_hearts]
      expect(hand.calculate_hand).to eq(:royal_flush)
    end

    it "detects a straight flush" do
      hand.cards = [jack_clubs, ten_clubs, nine_clubs, eight_clubs, seven_clubs]
      expect(hand.calculate_hand).to eq(:straight_flush)
    end

    it "detects a four-of-a-kind" do
      hand.cards = [five_hearts, five_spades, five_diamonds, five_clubs, ace_clubs]
      expect(hand.calculate_hand).to eq(:four_kind)
    end

    it "detects full house" do
      hand.cards = [five_hearts, five_spades, five_diamonds, ace_hearts, ace_clubs]
      expect(hand.calculate_hand).to eq(:full_house)
    end

    it "detects a flush" do
      hand.cards = [ace_clubs, jack_clubs, queen_clubs, eight_clubs, seven_clubs]
      expect(hand.calculate_hand).to eq(:flush)
    end

    it "detects a straight" do
      hand.cards = [eight_diamonds, seven_clubs, six_clubs, five_diamonds, four_diamonds]
      expect(hand.calculate_hand).to eq(:straight)
    end

    it "detects a three-of-a-kind" do
      hand.cards = [five_clubs, five_diamonds, five_hearts, ten_hearts, ace_hearts]
      expect(hand.calculate_hand).to eq(:three_kind)
    end

    it "detects a two-pair" do
      hand.cards = [four_spades, four_diamonds, five_clubs, five_diamonds, ace_clubs]
      expect(hand.calculate_hand).to eq(:two_pair)
    end

    it "detects a one-pair" do
      hand.cards = [four_spades, four_diamonds, ten_clubs, seven_clubs, ace_clubs]
      expect(hand.calculate_hand).to eq(:royal_flush)
    end

    it "detects nothing/high-card" do
      hand.cards = [king_hearts, queen_clubs, seven_clubs, four_diamonds, three_hearts]
      expect(hand.calculate_hand).to eq(:royal_flush)
    end

  end
end