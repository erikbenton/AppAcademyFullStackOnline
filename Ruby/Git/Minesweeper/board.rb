require_relative "tile"
require "byebug"
class Board
  attr_reader :grid

  def initialize(size)
    @grid = Array.new(size) { Array.new(size) {Tile.new} }
    # debugger
    @bomb_locations = self.create_bomb_locations
    populate_bombs
    update_tiles
  end

  def create_bomb_locations
    num_bombs = (size * size) / 4
    locations = []
    until locations.length == num_bombs
      x = rand(0...size)
      y = rand(0...size)
      locations << [x, y] if !locations.include?([x,y])
    end
    # debugger
    locations
  end

  def populate_bombs
    @bomb_locations.each do |pos|
      # debugger
      self[pos] = Tile.new("B") 
    end
  end

  def update_tiles
    grid.each_with_index do |row, y|
      row.each_with_index do |tile, x|
        bomb_count = 0
        if tile.to_s != "B"
          changes = [[-1,-1],[-1,0],[0,-1],[1,1],[1,0],[0,1], [-1,1], [1,-1]]
          changes.each do |change|
            local_x = x + change[0]
            local_y = y + change[1]
            if local_x.between?(0, size - 1) and local_y.between?(0, size - 1)
              local_tile = [local_y, local_x]
              bomb_count += 1 if self[local_tile].to_s == "B"
            end
          end
          tile.value = bomb_count
        end
      end
    end
  end

  def [](pos)
    x, y = pos
    grid[x][y]
  end

  def []=(pos, val)
    x, y = pos
    grid[x][y] = val
  end

  def rows
    grid
  end

  def columns
    grid.transpose
  end

  def size
    grid.length
  end

  def render
    puts "  " + (0...size).to_a.join(" ")
    rows.each_with_index do |row, idx|
      row_string = ""
      row.each do |tile|
        if tile.revealed? || true
          row_string += " " + tile.to_s
        else
          row_string += " X"
        end
      end
      puts idx.to_s + row_string
    end
  end
end

if __FILE__ == $PROGRAM_NAME
  board = Board.new(4)
  board.render
  pos = []
end