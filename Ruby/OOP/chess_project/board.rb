require "byebug"
require_relative "piece.rb"
require_relative "null_piece.rb"
require_relative "rook_bishop_queen.rb"
class Board
  
  attr_reader :rows

  def initialize
    initialize_nulls
    initialize_rows
    @sentinel = NullPiece.new(nil, nil, nil)
  end

  def initialize_nulls
    @rows = Array.new(8) { Array.new(8) }
    (0..7).each do |row|
      (0..7).each do |col|
        pos = [row, col]
        self.add_piece(NullPiece.new(nil, nil, pos), pos)
      end
    end
  end

  def initialize_pawns(color)
    row = color == :black ? 6 : 1
    self.add_piece(Piece.new(color, self, [row,0]), [row,0])
    self.add_piece(Piece.new(color, self, [row,1]), [row,1])
    self.add_piece(Piece.new(color, self, [row,2]), [row,2])
    self.add_piece(Piece.new(color, self, [row,3]), [row,3])
    self.add_piece(Piece.new(color, self, [row,4]), [row,4])
    self.add_piece(Piece.new(color, self, [row,5]), [row,5])
    self.add_piece(Piece.new(color, self, [row,6]), [row,6])
    self.add_piece(Piece.new(color, self, [row,7]), [row,7])
  end

  def initialize_royalty(color)
    row = color == :black ? 7 : 0
    self.add_piece(Rook.new(color, self, [row,0]), [row,0])
    self.add_piece(Piece.new(color, self, [row,1]), [row,1])
    self.add_piece(Bishop.new(color, self, [row,2]), [row,2])
    self.add_piece(Piece.new(color, self, [row,3]), [row,3])
    self.add_piece(Queen.new(color, self, [row,4]), [row,4])
    self.add_piece(Bishop.new(color, self, [row,5]), [row,5])
    self.add_piece(Piece.new(color, self, [row,6]), [row,6])
    self.add_piece(Rook.new(color, self, [row,7]), [row,7])
  end

  def initialize_rows
    initialize_royalty(:black)
    initialize_pawns(:black)
    initialize_royalty(:white)
    initialize_pawns(:white)
  end

  def [](pos)
    valid_pos?(pos)
    row, col = pos
    rows[row][col]
  end

  def []=(pos, val)
    row, col = pos
    rows[row][col] = val
  end

  def move_piece(start_pos, end_pos)
    raise "No piece at start position" unless self[start_pos].is_a?(Piece)
    begin
      self[start_pos].pos = end_pos
      self.add_piece(self[start_pos], end_pos)
      self.add_piece(NullPiece.new(nil, nil, start_pos), start_pos)
    rescue => exception
      raise "Unable to move there: " + exception.message
    end
    true
  end

  def valid_pos?(pos)
    raise "Non-Integer position" unless pos.all? { |el| el.is_a?(Integer) }
    raise "Position off the board" unless pos.all? { |el| el.between?(0,8) }
    true
  end

  def add_piece(piece, pos)
    raise "Non-Valid piece" unless piece.is_a?(Piece) || piece.is_a?(NullPiece)
    valid_pos?(pos)
    self[pos] = piece
  end

  def checkmate?(color)

  end

  def in_check?(color)

  end

  def find_king(color)

  end

  def pieces
    rows.flatten
  end

  def dup
    pieces_clone = pieces
    new_board = Board.new
    pieces_clone.each do |piece|
      new_piece = piece.class.new(piece.color, new_board, piece.pos)
      new_board.add_piece(new_piece, new_piece.pos)
    end
    new_board
  end

  def move_piece!(color, start_pos, end_pos)
    raise "No piece at start position" unless self[start_pos].is_a?(Piece)
    begin
      new_board = self.dup
      new_board[start_pos].pos = end_pos
      new_board.add_piece(new_board[start_pos], end_pos)
      new_board.add_piece(NullPiece.new(nil, nil, start_pos), start_pos)
    rescue => exception
      raise "Unable to move there: " + exception.message
    end
    new_board
  end

  def render
    rows.each do |row|
      row.each do |piece|
        print piece.symbol + " "
      end
      puts
    end
  end

end

if __FILE__ == $PROGRAM_NAME
  b = Board.new
  p b.move_piece([0,0], [2,2])
  puts "b after move [2,2]"
  p b[[2,2]]
  puts "Duping b"
  n_b = b.dup
  puts "n_b before move [2,2]"
  p n_b[[2,2]]
  puts 
  p n_b.move_piece([2,2], [0,0])
  puts "n_b after move [2,2]"
  p n_b[[2,2]]
  puts "===="
  p b[[0,0]]
  puts
  puts
  p n_b[[0,0]]
  puts
  p b[[2,2]].to_s
  puts
  p b[[2,2]].moves
  puts
  b.render
  puts
  b.move_piece([0,2], [3,3])
  b.render
  puts
  p b[[3,3]].moves

end