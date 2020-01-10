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

    context "with a huge amount" do
      subject(:brownie) { Dessert.new("brownie", 100000) }
      it "sets the type to the giant version" do
        expect(brownie.type).to eq("giant brownie")
      end
    end

    it "raises an error if the amount is not a number" do
      expect { Dessert.new("brownie", "tons") }.to raise_error("amount must be a number")
    end
  end
end