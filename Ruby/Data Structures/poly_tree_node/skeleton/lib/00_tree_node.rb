class PolyTreeNode
  attr_reader :value, :children

  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  def parent=(parent_node)
    @parent = parent_node
    return unless parent_node
    parent_node.children << self
  end

  def parent
    @parent
  end

  def add_child(new_node)
    new_node.parent = new_node
  end
end