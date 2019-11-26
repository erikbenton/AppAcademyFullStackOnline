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
        if tile.revealed?
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