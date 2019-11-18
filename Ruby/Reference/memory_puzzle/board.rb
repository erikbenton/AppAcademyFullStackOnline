require_relative "card"
class Board
  def initialize(length)
    @length = length
    @grid = Array.new(@length) { [] }
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
    current_row = [""]
    current_row += (0...@length).to_a
    puts current_row.join(" ")
    (0...@length).each do |row|
      current_row = []
      current_row << row
      (0...@length).each do |col|
        current_card = @grid[row][col]
        if current_card.facing_down?
          current_row << " "
        else
          current_row << current_card.to_s
        end
      end
      puts current_row.join(" ")
    end
  end

  def won?
    flattened_grid = @grid.flatten
    flattened_grid.none? { |card| card.facing_down? }
  end
end