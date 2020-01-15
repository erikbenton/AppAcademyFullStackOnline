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
    it "returns the transpose the matrix A (rows <-> cols)" do
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
      non_square = [
        [0, 1, 2],
        [3, 4, 5]
      ]
      expect(mat.my_transpose).to eq(trans)
      expect { non_square.my_transpose }.to raise_error("not a square matrix")
    end
  end
end