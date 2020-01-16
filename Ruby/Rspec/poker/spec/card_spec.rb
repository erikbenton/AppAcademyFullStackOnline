require "card"

describe Card do
  describe "#initialize" do
    subject(:card) { Card.new(2, :diamond) }

    it "has a value" do
      expect(card.value).to eq(2)
    end

    it "has a suit" do
      expect(card.suit).to eq(:diamond)
    end
  end
end