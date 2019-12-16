require "byebug"
require_relative "piece.rb"
class Pawn < Piece

  def symbol
    return "P"
  end

  def move_dirs
    dir = color == :white ? 1 : -1
    dir
  end

  def moves
    dir = forward_dir
    possible_moves = []
    forward = [self.pos[0] + dir, self.pos[1]]
    left = [forward[0], self.pos[1] + 1]
    right = [forward[0], self.pos[1] - 1]
    begin
      possible_moves += forward_steps
      possible_moves += side_attacks
    rescue => exception
    end
    possible_moves
  end

  private

  def at_start_row?
    start_row = color == :white ? 1 : 6
    self.pos[0] == start_row
  end

  def forward_dir
    dir = color == :white ? 1 : -1
    dir
  end

  def forward_steps
    dir = forward_dir
    forward = [self.pos[0] + dir, self.pos[1]]
    possible_moves = []
    begin
      if self.board.valid_pos?(forward) && self.board[forward].empty?
        possible_moves.push(forward)
      end
      if at_start_row?
        double = [forward[0] + dir, self.pos[1]]
        if self.board.valid_pos?(double) && self.board[double].empty?
          possible_moves.push(double)
        end
      end
    rescue => exception
    end
    possible_moves
  end

  def side_attacks
    dir = forward_dir
    left = [self.pos[0] + dir, self.pos[1] + 1]
    right = [left[0], self.pos[1] - 1]
    possible_moves = []
    begin
      if self.board.valid_pos?(left) && self.opponent?(self.board[left])
        possible_moves.push(left)
      end
      if self.board.valid_pos?(right) && self.opponent?(self.board[right])
        possible_moves.push(right)
      end
    rescue => exception
    end
    possible_moves
  end

end