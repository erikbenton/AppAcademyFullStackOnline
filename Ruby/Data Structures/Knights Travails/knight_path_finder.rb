require_relative "poly_tree_node"

class KnightPathFinder
  def self.valid_moves(pos)
    moves = []
    changes = [[1,2],[-1,-2],[-1,2],[1,-2],[2,1],[-2,-1],[-2,1],[2,-1]]
    changes.each do |change|
      move = [pos[0] + change[0], pos[1] + change[1]]
      moves << move if move[0].between?(0,8) and move[1].between?(0,8)
    end
    moves
  end

  def initialize(root)
    @root_node = PolyTreeNode.new(root)
    @considered_positions = []
  end

  def new_move_positions
    new_moves = KnightPathFinder.valid_moves(@root_node.value).filter do |move|
      !@considered_positions.include?(move)
    end
    new_moves.each { |move| @considered_positions << move }
    new_moves
  end
end

if __FILE__ == $PROGRAM_NAME

  p KnightPathFinder.valid_moves([0,0])
  p KnightPathFinder.valid_moves([1,5])
  p KnightPathFinder.valid_moves([4,4])
  p KnightPathFinder.valid_moves([8,8])
  p KnightPathFinder.valid_moves([-8,-8])
  p KnightPathFinder.valid_moves([10,10])

end