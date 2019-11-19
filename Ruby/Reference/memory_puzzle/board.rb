require_relative "card"
require "byebug"
class Board

  attr_reader :length

  def initialize(length)
    @length = length
    @grid = Array.new(@length) { [] }
    self.populate
    max = @grid.flatten.max { |a, b| a <=> b }
    @cell_width = max.to_s.length
  end

  def get_deck
    num_pairs = (@length * @length) / 2
    values = (0...num_pairs).to_a
    values += values
    values.shuffle!
    cards = values.map { |val| Card.new(val) }
    cards
  end

  def populate
    cards = self.get_deck
    cards.each_with_index do |card, idx|
      row = idx / @length
      col = idx % @length
      @grid[row][col] = card
    end
  end

  def render
    system("clear")
    self.render_board_top
    self.render_rows
  end

  def render_board_top
    current_row = [" "]
    current_row += (0...@length).to_a.map! { |num| num.to_s.rjust(@cell_width) }
    puts current_row.join(" ")
  end

  def render_rows
    (0...@length).each do |row|
      current_row = [row]
      (0...@length).each do |col|
        current_card = @grid[row][col]
        current_row << get_card_value(current_card).rjust(@cell_width)
      end
      puts current_row.join(" ")
    end
  end

  def get_card_value(card)
    if card.facing_down?
      return "?"
    else
      return card.to_s
    end
  end

  def won?
    flattened_grid = @grid.flatten
    flattened_grid.none? { |card| card.facing_down? }
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end
end