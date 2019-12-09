require_relative 'tic_tac_toe'

class TicTacToeNode

  attr_accessor :board, :next_mover_mark, :prev_move_pos

  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
  end

  def losing_node?(evaluator)
    if board.over?
      return board.winner != evaluator
    end
    if evaluator == next_mover_mark
      return children.all? do |child|
        child.losing_node?(evaluator)
      end
    else
      return children.any? do |child|
        child.losing_node?(evaluator)
      end
    end
  end

  def winning_node?(evaluator)
    if board.over?
      return board.winner == evaluator
    end
    if evaluator == next_mover_mark
      return children.any? do |child|
        child.winning_node?(evaluator)
      end
    else
      return children.all? do |child|
        child.winning_node?(evaluator)
      end
    end
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    all_children = []
    new_mark = (next_mover_mark == :x) ? :o : :x
    (0...3).to_a.each do |row_idx|
      (0...3).to_a.each do |col_idx|
        pos = [row_idx, col_idx]
        if board.empty?(pos)
          new_board = board.dup
          new_board[pos] = next_mover_mark
          all_children << TicTacToeNode.new(new_board, new_mark, pos)
        end
      end
    end
    all_children
  end
end

if __FILE__ == $PROGRAM_NAME
  board = Board.new
  node = TicTacToeNode.new(board, nil)
  (0...3).to_a.each do |row_idx|
    (0...3).to_a.each do |col_idx|
      pos = [row_idx, col_idx]
      p node.board.empty?(pos)
    end
  end
end