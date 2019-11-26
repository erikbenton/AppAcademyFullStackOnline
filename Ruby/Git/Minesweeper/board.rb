class Board
  attr_reader :grid
  def initialize(size)
    @grid = Array.new(size) { [] }
  end

  def [](pos)
    x, y = pos
    grid[x][y]
  end

  def []=(pos, val)
    x, y = pos
    grid[x][y] = val
  end
end