require_relative "tile"
require "byebug"
class Board
  attr_reader :grid

  def initialize(size)
    @grid = Array.new(size) { Array.new(size) {Tile.new} }
    @num_bombs = (size * size) / 6
    populate_bombs
  end
  
  def populate_bombs
    create_bomb_locations
    place_bombs
    update_tile_values
  end

  def create_bomb_locations
    locations = []
    until locations.length == @num_bombs
      x = rand(0...size)
      y = rand(0...size)
      locations << [x, y] if !locations.include?([x,y])
    end
    locations
  end

  def place_bombs
    create_bomb_locations.each do |pos|
      self[pos] = Tile.new("B") 
    end
  end

  def update_tile_values
    grid.each_with_index do |row, y|
      row.each_with_index do |tile, x|
        bomb_count = 0
        if !tile.bomb?
          changes = [[-1,-1],[-1,0],[0,-1],[1,1],[1,0],[0,1], [-1,1], [1,-1]]
          changes.each do |change|
            local_x = x + change[0]
            local_y = y + change[1]
            local_tile = [local_y, local_x]
            if valid_position?(local_tile)
              bomb_count += 1 if self[local_tile].bomb?
            end
          end
          tile.value = bomb_count
        end
      end
    end
  end

  def valid_position?(pos)
    return false if !pos.is_a?(Array)
    x, y = pos
    x.between?(0, size - 1) and y.between?(0, size - 1)
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
        if tile.revealed? or tile.flagged?
          row_string += " " + tile.to_s
        else
          row_string += " X"
        end
      end
      puts idx.to_s + row_string
    end
    puts "There are: #{@num_bombs} bombs and #{number_revealed}/#{number_playable_tiles} non-bomb tiles"
  end

  def game_over?(guess)
    self[guess].to_s == "B"
  end

  def over?
    grid.flatten.all? { |tile| tile.revealed? or tile.bomb? }
  end

  def reveal_neighbors(pos)
    tile = self[pos]
    if !tile.bomb? and !tile.flagged?
      changes = [[-1,0],[0,-1],[1,0],[0,1]]
      changes.each do |change|
        local_x = pos[1] + change[0]
        local_y = pos[0] + change[1]
        local_tile = [local_y, local_x]
        if valid_position?(local_tile)
          if !self[local_tile].bomb? and !self[local_tile].revealed?
            self[local_tile].reveal
            self.reveal_neighbors(local_tile) if self[local_tile].value == 0
          end
        end
      end
      tile.reveal
    end
  end

  def reveal
    puts "  " + (0...size).to_a.join(" ")
    rows.each_with_index do |row, idx|
      row_string = ""
      row.each do |tile|
        row_string += " " + tile.value.to_s
      end
      puts idx.to_s + row_string
    end
  end

  def number_revealed
    grid.flatten.count { |tile| tile.revealed? }
  end

  def number_playable_tiles
    grid.flatten.length - @num_bombs
  end

  def check_position(pos)
    if pos.length == 3 and !self[pos[0..1]].revealed?
      self[pos[0..1]].flag
      return true
    elsif !self[pos].bomb? and !self[pos].flagged?
      reveal_neighbors(pos)
      self[pos].reveal
      return true
    else
      return false
    end
  end
end

if __FILE__ == $PROGRAM_NAME
  board = Board.new(10)
  board.render
  pos = []
end