require "dessert"

describe Dessert do
  subject(:brownie) { Dessert.new("brownie") }

  describe "#initialize" do
    it "takes in a type" do
      expect(brownie.type).to eq("brownie")
    end
  end
end