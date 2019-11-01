class Board

  attr_reader :size

  def initialize(n)
    @grid = Board.create_grid(n, n, :N)
    @size = n * n
  end

  def self.create_grid(rows, cols, filler)
    res = []
    rows.times do
      sub_res = []
      cols.times { sub_res << filler }
      res << sub_res
    end
    res
  end

  def [](pos)
    row, col = pos
    @grid[row][col[1]]
  end

  def []=(pos, val)
    @grid[pos[0]][pos[1]] = val
  end

  def num_ships
    flattened_board = @grid.flatten
    flattened_board.count { |ele| ele == :S }
  end

end
