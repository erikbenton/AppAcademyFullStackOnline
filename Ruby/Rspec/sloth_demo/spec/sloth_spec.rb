require "sloth"

describe Sloth do
  describe "#initialize" do
    it "assigns a name" do
      expect(sloth.name).to eq("Herbert")
    end
  end
end