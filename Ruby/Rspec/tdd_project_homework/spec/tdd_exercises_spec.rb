require "tdd_exercises"
require "byebug"

describe Array do
  describe "#my_uniq" do
    it "removes duplicates from an array" do
      arr = [1, 1, 2, 2, 3, 3]
      expect(arr.my_uniq).to eq([1, 2, 3])
      expect(arr).to eq([1, 1, 2, 2, 3, 3])
    end
  end

  describe "#two_sum" do
    it "finds all pairs of positions where the elements at those indices sum to 0" do
      arr = [-1, 0, 2, -2, 1]
      expect(arr.two_sum).to eq([[0, 4], [2,3]])
    end
  end

  describe "#my_transpose" do
    it "returns the transpose a square n by n matrix (rows <-> cols)" do
      mat = [
        [0, 1, 2],
        [3, 4, 5],
        [6, 7, 8]
      ]
      trans = [
        [0, 3, 6],
        [1, 4, 7],
        [2, 5, 8]
      ]
      
      expect(mat.my_transpose).to eq(trans)
    end

    context "when the matrix is non-square (n by m)" do
      it "returns an m by n transpose of an n by m matrix" do
        non_square = [
          [0, 1, 2],
          [3, 4, 5]
        ]
        non_square_trans = [
          [0, 3],
          [1, 4],
          [2, 5]
        ]    
        expect(non_square.my_transpose).to eq(non_square_trans)
      end
    end
  end
end

describe "stock_picker" do

  easy = [10, 9, 10, 1, 4, 7, 55, 8]
  max_first = [10, 9, 11, 1, 4, 7, 10, 8]
  bad = [10, 9, 8, 7, 6, 5, 4, 3]
  not_stocks = ["a", 7, Array.new(), 6]

  it "accepts an array of stock prices" do
    expect { stock_picker(easy) }.to_not raise_error()
    expect { stock_picker([]) }.to raise_error("not enough days of stocks")
    expect { stock_picker([]) }.to raise_error("not enough days of stocks")
    expect { stock_picker([1, 4]) }.to_not raise_error()
    expect { stock_picker(not_stocks) }.to raise_error("invalid stock prices")
  end

  context "when the lowest day is before the max day" do
    it "finds the best day to sell" do
      expect(stock_picker(easy)).to eq([3, 6])
    end
  end

  context "when the lowest day is after the max day" do
    it "finds the best day to sell" do
      expect(stock_picker(max_first)).to eq([3, 6])
    end
  end

  context "when the prices only go down" do
    it "finds the best day to sell" do
      expect(stock_picker(max_first)).to eq([3, 6])
    end
  end
end

describe TowersOfHanoi do
  
  describe "#initialize" do
    it "initializes with 1 full pillar and 2 empty pillars" do
      towers = TowersOfHanoi.new
      expect(towers.pillar_1).to eq([3, 2, 1])
      expect(towers.pillar_2).to eq([0, 0, 0])
      expect(towers.pillar_3).to eq([0, 0, 0])
    end
  end
end