require "dessert"

describe Dessert do
  subject(:brownie) { Dessert.new("brownie", 50) }

  describe "#initialize" do
    it "takes in a type" do
      expect(brownie.type).to eq("brownie")
    end

    it "takes in an amount" do
      expect(brownie.amount).to eq(50)
    end
  end
end