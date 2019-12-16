module Stepable
  def moves
    diffs = self.move_diffs
    possible_moves = []
    diffs.each do |diff|
      next_pos = [self.pos[0] + diff[0], self.pos[1] + diff[1]]
      begin
        if self.board.valid_pos?(next_pos)
          if self.board[next_pos].color != self.color
            possible_moves.push(next_pos)
          end
        end
      rescue => exception
      end
    end
    possible_moves
  end
end