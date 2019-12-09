require_relative 'tic_tac_toe_node'
require "byebug"
class SuperComputerPlayer < ComputerPlayer
  def move(game, mark)
    new_node = TicTacToeNode.new(game.board, mark)
    new_mark = (mark == :x) ? :o : :x
    contingency = nil
    new_node.children.each do |child|
      return child.prev_move_pos if child.winning_node?(mark)
      contingency = child if child.losing_node?(new_mark)
    end
    raise TicTacToe::IllegalMoveError if contingency.nil?
    contingency.prev_move_pos
  end
end

if __FILE__ == $PROGRAM_NAME
  puts "Play the brilliant computer!"
  hp = HumanPlayer.new("Jeff")
  cp = SuperComputerPlayer.new

  TicTacToe.new(hp, cp).run
end
