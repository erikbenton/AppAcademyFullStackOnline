class Board

  attr_reader :size
  
  def self.create_grid(rows, cols, filler)
    Array.new(rows) { Array.new(cols, filler) }
  end
  
  def self.print_grid(grid)
    grid.each do |row|
      puts row.join(" ")
    end
  end

  def initialize(n)
    @grid = Board.create_grid(n, n, :N)
    @size = n * n
  end
  
  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, val)
    row, col = pos
    @grid[row][col] = val
  end

  def num_ships
    flattened_board = @grid.flatten
    flattened_board.count { |ele| ele == :S }
  end

  def attack(pos)
    if self[pos] == :S
      self[pos] = :H
      puts "you sunk my battleship!"
      return true
    else
      self[pos] = :X
      return false
    end
  end

  # def place_random_ships
  #   spots = @size / 4
  #   new_ships = []
  #   spots.times do
  #     new_ship = self.get_random_position
  #     until !new_ships.include?(new_ship)
  #       new_ship = self.get_random_position
  #     end
  #     new_ships << new_ship
  #     self[new_ship] = :S
  #   end
  # end

  def get_random_position
    [rand(0...@grid.length), rand(0...@grid.length)]
  end

  def place_random_ships
    total_ships = @size / 4
    while self.num_ships < total_ships
      self[self.get_random_position] = :S
    end
  end

  # def hidden_ships_grid
  #   new_board = Board.create_grid(@grid.length, @grid.length, :N)
  #   @grid.each_with_index do |row, x|
  #     row.each_with_index do |spot, y|
  #       pos = [x, y]
  #       new_board[x][y] = self[pos] if self[pos] != :S
  #     end
  #   end
  #   new_board
  # end

  def hidden_ships_grid
    @grid.map do |row|
      row.map do |ele|
        if ele == :S
          :N
        else
          ele
        end
      end
    end
  end

  def cheat
    Board.print_grid(@grid)
  end

  def print
    Board.print_grid(self.hidden_ships_grid)
  end

end
