require "sloth"

describe Sloth do
  subject(:sloth) { Sloth.new("Herbert") }

  describe "#initialize" do
    it "assigns a name" do
      expect(sloth.name).to eq("Herbert")
    end

    it "starts with an empty foods array" do
      expect(sloth.foods).to be_empty
    end
  end

  describe "#eat" do
    it "adds a new food to the foods array" do
      expect(sloth.foods).to_not include("leaves")
      sloth.eat("leaves")
      expect(sloth.foods).to include("leaves")
    end
  end

  describe "#drink" do
    before(:each) { sloth.drink("lemonade", 10)}
    it "adds the drink as a key to the drinks hash" do
      expect(sloth.drinks).to have_key("lemonade")
    end
    
    it "adds the amount as a value to the drinks hash" do
      expect(sloth.drinks).to have_value(10)
    end
  end
end