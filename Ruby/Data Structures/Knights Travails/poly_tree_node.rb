require "byebug"
class PolyTreeNode
  attr_reader :value, :children
  attr_writer :children

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

  def add_child(child)
    child.parent = self
  end

  def remove_child(child)
    child.parent = nil
    raise "Not a child" unless @children.delete(child)
  end

  def dfs(target)
    return nil if self.nil?
    return self if self.value == target
    @children.each do |child|
      search_res = child.dfs(target)
      return search_res unless search_res.nil?
    end
    nil
  end

  def bfs(target)
    queue = [self]
    until queue.empty?
      el = queue.shift
      return el if el.value == target
      el.children.each do |child|
        queue << child
      end
    end
  end

  def inspect
    { 'value' => @value, 'parent' => @parent, "children" => @children }.inspect
  end
end