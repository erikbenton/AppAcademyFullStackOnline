require "byebug"
class PolyTreeNode
  attr_reader :value, :children

  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  def parent=(new_parent)
    @parent.children.delete(self) unless @parent.nil?
    @parent = new_parent
    new_parent.children << self unless new_parent.nil?
  end

  def parent
    @parent
  end

  def add_child(new_node)
    new_node.parent = new_node
  end
end

if __FILE__ == $PROGRAM_NAME

  n1 = PolyTreeNode.new("root1")
  n2 = PolyTreeNode.new("root2")
  n3 = PolyTreeNode.new("root3")

  # connect n3 to n1
  n3.parent = n1
  # connect n3 to n2
  n3.parent = n2

  # this should work
  raise "Bad parent=!" unless n3.parent == n2
  raise "Bad parent=!" unless n2.children == [n3]

  # this probably doesn't
  raise "Bad parent=!" unless n1.children == []

end