require "byebug"
class Node
  attr_reader :key
  attr_accessor :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    prev_node = self.prev
    next_node = self.next
    prev_node.next = next_node
    next_node.prev = prev_node
    self.next = nil
    self.prev = nil
  end
end

class LinkedList
  include Enumerable

  def initialize
    @head = Node.new
    @tail = Node.new
    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head.next
  end

  def last
    @tail.prev
  end

  def empty?
    @head.next == @tail
  end

  def get(key)
    current_node = first
    until current_node.next.nil?
      return current_node.val if current_node.key == key
      current_node = current_node.next
    end
    nil
  end

  def include?(key)
    current_node = first
    until current_node.next.nil?
      return true if current_node.key == key
      current_node = current_node.next
    end
    false
  end

  def append(key, val)
    new_node = Node.new(key, val)
    last.next = new_node
    new_node.prev = last
    new_node.next = @tail
    @tail.prev = new_node
  end

  def update(key, val)
    current_node = first
    until current_node.next.nil?
      return current_node.val = val if current_node.key == key
      current_node = current_node.next
    end
    nil
  end

  def remove(key)
    current_node = first
    until current_node.next.nil?
      return current_node.remove if current_node.key == key
      current_node = current_node.next
    end
    nil
  end

  def each
  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
end
