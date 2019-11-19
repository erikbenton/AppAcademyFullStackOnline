require "colorize"
require_relative "tile"
require "byebug"
class Board

  attr_reader :board

  def initialize(puzzle_lines)
    @board = []
    puzzle_lines.each_with_index do |line|
      tiles = []
      line.split("").each do |num|
        tiles << Tile.new(num.to_i)
      end
      @board << tiles
    end
  end

  def render
    @board.each_with_index do |row, row_idx|
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
end

board = Board.new(File.open("./puzzles/sudoku1.txt").readlines.join("").split("\n"))
board.render