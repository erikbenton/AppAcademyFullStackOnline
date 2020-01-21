require "hand"

describe Hand do
  subect(:hand) { Hand.new }

  describe "#initialize" do
    it "starts with 0 cards" do
      expect(hand.cards.empty?).to eq(true)    
    end
  end

  describe "#calculate_hand" do
    king_hearts = Card.new(13, :heart)
    queen_hearts = Card.new(12, :heart)
    jack_hearts = Card.new(11, :heart)
    ten_hearts = Card.new(10, :heart)
    ace_hearts = Card.new(1, :heart)

    it "detects a royal flush" do
      hand.cards = [king_hearts, queen_hearts, jack_hearts, ten_hearts, ace_hearts]
    end

    it "detects a straight flush" do
      
    end

    it "detects full house" do
      
    end

    it "detects a flush" do
      
    end

    it "detects a straight" do
      
    end

    it "detects a three-of-a-kind" do
      
    end

    it "detects a two-pair" do
      
    end

    it "detects a one-pair" do
      
    end

    it "detects nothing" do
      
    end

  end
end