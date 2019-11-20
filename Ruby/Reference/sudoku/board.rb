require "colorize"
require_relative "tile"
require "byebug"
class Board

  attr_reader :grid

  def initialize(puzzle_lines)
    @grid = []
    puzzle_lines.each_with_index do |line|
      tiles = []
      line.split("").each do |num|
        tiles << Tile.new(num.to_i)
      end
      @grid << tiles
    end
  end

  def render
    @grid.each_with_index do |row, row_idx|
      row_str = ""
      row.each_with_index do |tile, col_idx|
        if col_idx > 0 and col_idx % 3 == 0
          row_str += "|".yellow
        end
        row_str += " " + tile.to_s + " "
      end
      if row_idx.between?(1, 8) and row_idx % 3 == 0
        puts ("-" * 29).yellow
      end
      puts row_str
    end
  end

  def reveal
    @grid.each_with_index do |row, row_idx|
      row_str = ""
      row.each_with_index do |tile, col_idx|
        if col_idx > 0 and col_idx % 3 == 0
          row_str += "|".yellow
        end
        row_str += " " + tile.to_i.to_s + " "
      end
      if row_idx.between?(1, 8) and row_idx % 3 == 0
        puts ("-" * 29).yellow
      end
      puts row_str
    end
  end

  def get_relevant_horizontal_tiles(row_idx)
    horizontal_checks = @grid[row_idx].map { |card| card.to_i }
  end

  def get_relevant_vertical_tiles(row_idx, col_idx)
    vertical_checks = @grid.map { |row| row[col_idx].to_i }
  end

  def get_square_index(idx)
    idx = (idx / 3).to_i
    idx *= 3
  end

  def get_relevant_square_tiles(row_idx, col_idx)
    row_start = self.get_square_index(row_idx)
    col_start = self.get_square_index(col_idx)
    col_end = col_start + 3
    square_checks = []
    (0...3).each do |num|
      square_checks += @grid[row_start + num][col_start...col_end].map { |card| card.to_i }
    end
    square_checks
  end
  
  def valid_value?(row_idx, col_idx, val)
    return false if @grid[row_idx][col_idx].to_s != "X".red
    horizontal_checks = self.get_relevant_horizontal_tiles(row_idx)
    vertical_checks = self.get_relevant_vertical_tiles(row_idx, col_idx)
    square_checks = self.get_relevant_square_tiles(row_idx, col_idx)
    all_tiles = horizontal_checks + vertical_checks + square_checks
    return false if all_tiles.include?(val)
    true
  end

  def actual_value?(row_idx, col_idx, val)
    return true if @grid[row_idx][col_idx].to_i == val
    false
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, val)
    row, col = pos
    @grid[row][col] = val
  end
end

if __FILE__ == $PROGRAM_NAME
  board = Board.new(File.open("./puzzles/sudoku1.txt").readlines.join("").split("\n"))
  board.render
  p board.valid_value?(4, 4, 7)
  p board.valid_value?(4, 4, 4)
  p board.valid_value?(5, 4, 4)
end