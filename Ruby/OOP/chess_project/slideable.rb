require "byebug"
module Slideable

  @@HORIZONTAL_DIRS = [[1,0], [0,1], [-1,0], [0,-1]]
  @@DIAGONAL_DIRS = [[1,1], [-1,1], [1,-1], [-1,-1]]

  def horizontal_dirs
    moves = []
    @@HORIZONTAL_DIRS.each do |dir|
      moves += grow_unblocked_moves_in_dir(dir[0], dir[1])
    end
    moves
  end

  def diagonal_dirs
    moves = []
    @@DIAGONAL_DIRS.each do |dir|
      moves += grow_unblocked_moves_in_dir(dir[0], dir[1])
    end
    moves
  end

  def moves
    direction = move_dirs
    possible_moves = []
    possible_moves += horizontal_dirs unless direction == :diagonal
    possible_moves += diagonal_dirs unless direction == :horizontal
    possible_moves
  end

  private

  def move_dirs
    self.class.move_dirs
  end

  def grow_unblocked_moves_in_dir(dx, dy)
    start = self.pos
    next_pos = [start[0] + dx, start[1] + dy]
    moves = []
    begin
      while self.board.valid_pos?(next_pos)
        if self.board[next_pos].is_a?(NullPiece)
          moves.push(next_pos)
          next_pos = [next_pos[0] + dx, next_pos[1] + dy]
        else
          moves.push(next_pos) if self.board[next_pos].color != self.color
          break
        end
      end
    rescue => exception
    end
    moves
  end

end