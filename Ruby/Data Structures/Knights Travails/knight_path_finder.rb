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
    KnightPathFinder.valid_moves(root).each do |child|
      @root_node.add_child(PolyTreeNode.new(child))
    end
  end

  def new_move_positions
    new_moves = KnightPathFinder.valid_moves(@root_node.value).filter do |move|
      !@considered_positions.include?(move)
    end
    new_moves.each { |move| @considered_positions << move }
    new_moves
  end

  def build_move_tree(target)
    queue = [@root_node]
    until queue.empty?
      debugger
      node = queue.shift
      return node if node.value == target
      node.children.each do |child|
        child.children = new_move_positions.map { |move| PolyTreeNode.new(move) }
        queue << child
      end
    end
  end
end

if __FILE__ == $PROGRAM_NAME

  p KnightPathFinder.valid_moves([0,0])
  p KnightPathFinder.valid_moves([1,5])
  p KnightPathFinder.valid_moves([4,4])
  p KnightPathFinder.valid_moves([8,8])
  p KnightPathFinder.valid_moves([-8,-8])
  p KnightPathFinder.valid_moves([10,10])

  knight = KnightPathFinder.new([0,0])
  knight.build_move_tree([2,1])

end