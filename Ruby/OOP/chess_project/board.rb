require_relative "piece.rb"
require_relative "null_piece.rb"
class Board
  
  attr_reader :rows

  def initialize
    @rows = Array.new(8) { Array.new(8, NullPiece.new) }
    initialize_rows
    @sentinel = NullPiece.new
  end

  def initialize_pawns(color)
    row = color == :black ? 6 : 1
    self[[row,0]] = Piece.new(color, self, [row,0])
    self[[row,1]] = Piece.new(color, self, [row,1])
    self[[row,2]] = Piece.new(color, self, [row,2])
    self[[row,3]] = Piece.new(color, self, [row,3])
    self[[row,4]] = Piece.new(color, self, [row,4])
    self[[row,5]] = Piece.new(color, self, [row,5])
    self[[row,6]] = Piece.new(color, self, [row,6])
    self[[row,7]] = Piece.new(color, self, [row,7])
  end

  def initialize_royalty(color)
    row = color == :black ? 7 : 0
    self[[row,0]] = Piece.new(color, self, [row,0])
    self[[row,1]] = Piece.new(color, self, [row,1])
    self[[row,2]] = Piece.new(color, self, [row,2])
    self[[row,3]] = Piece.new(color, self, [row,3])
    self[[row,4]] = Piece.new(color, self, [row,4])
    self[[row,5]] = Piece.new(color, self, [row,5])
    self[[row,6]] = Piece.new(color, self, [row,6])
    self[[row,7]] = Piece.new(color, self, [row,7])
  end

  def initialize_rows
    initialize_royalty(:black)
    initialize_pawns(:black)
    initialize_royalty(:white)
    initialize_pawns(:white)
  end

  def [](pos)
    row, col = pos
    rows[row][col]
  end

  def []=(pos, val)
    row, col = pos
    rows[row][col] = val
  end

  def move_piece(start_pos, end_pos)
    raise "No peice at start" if self[start_pos].is_a?(NullPiece)
    begin
      self[end_pos] = self[start_pos]
      self[start_pos] = NullPiece.new
    rescue => exception
      raise "Unable to move there"
    end
    true
  end
end

if __FILE__ == $PROGRAM_NAME
  b = Board.new
  p b.move_piece([0,0], ["A",2])
  puts
  p b
end