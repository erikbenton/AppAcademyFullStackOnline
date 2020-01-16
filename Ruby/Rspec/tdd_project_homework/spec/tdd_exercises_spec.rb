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
  toh = TowersOfHanoi.new
  
  describe "#initialize" do
    it "starts with three towers" do
      expect(toh.towers.length).to eq(3)
    end

    it "initializes with 1 full pillar and 2 empty pillars" do
      expect(toh.towers[0]).to eq([3, 2, 1])
      expect(toh.towers[1]).to eq([])
      expect(toh.towers[2]).to eq([])
    end
  end

  describe "#move(from, to)" do
    it "moves the top disc in the 'from' pillar to the 'to' pillar" do
      expect(toh.towers[0]).to eq([3, 2, 1])
      expect(toh.towers[1]).to eq([])
      toh.move(0, 1)
      expect(toh.towers[0]).to eq([3, 2])
      expect(toh.towers[1]).to eq([1])
    end

    context "if trying to place a larger disc on a smaller disc" do
      it "raises an error about being an invalid move" do
        toh.towers[0] = [3,2]
        toh.towers[1] = [1]
        expect {toh.move(0, 1) }.to raise_error("invalid move: large disc on top of small disc")
      end
    end
    context "if trying to move a disc from an empty pillar" do
      it "raises an error about being an invalid move" do
        toh.towers[0] = []
        toh.towers[1] = []
        expect {toh.move(0, 1) }.to raise_error("invalid move: no discs in that tower")
      end
    end
  end

  describe "#won?" do

    context "when the game isn't over" do
      it "returns false" do
        toh.towers[0] = [3]
        toh.towers[1] = [2]
        toh.towers[2] = [1]
        expect(toh.won?).to eq(false)
      end
    end

    context "when the game is over" do
      it "finds all discs on the last tower" do
        toh.towers[0] = []
        toh.towers[1] = []
        toh.towers[2] = [3,2,1]
        expect(toh.won?).to eq(true)
      end

      it "makes sure all the discs are in the proper order" do
        toh.towers[0] = []
        toh.towers[1] = []
        toh.towers[2] = [2,1,3]
        expect(toh.won?).to eq(false)
      end
    end
  end
end