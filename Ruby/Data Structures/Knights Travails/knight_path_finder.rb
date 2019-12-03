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
    @considered_positions = [root]
  end
end