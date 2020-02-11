require_relative 'p05_hash_map'
require_relative 'p04_linked_list'
require "byebug"
class LRUCache
  def initialize(max, prc)
    @map = HashMap.new
    @store = LinkedList.new
    @max = max
    @prc = prc
  end

  def count
    @map.count
  end

  def get(key)
    node = @map.get(key)
    if node.nil?
      node = calc!(key)
    else
      update_node!(node)
    end
    node.val
  end

  def to_s
    'Map: ' + @map.to_s + '\n' + 'Store: ' + @store.to_s
  end

  private

  def calc!(key)
    # suggested helper method; insert an (un-cached) key
    # debugger
    val = @prc.call(key)
    @store.append(key, val)
    @map.set(key, @store.last)
    eject! if @map.count > @max
    return val
  end

  def update_node!(node)
    # suggested helper method; move a node to the end of the list
    # First take the node to be updated "out of the list"
    node.prev.next = node.next
    node.next.prev = node.prev
    # Attach the node to the last and tail node
    node.next = @store.tail
    node.prev = @store.last
    # Put node between the last and tail node
    @store.last.next = node
    @store.tail.prev = node
    node.val
  end

  def eject!
    @store.first.remove
  end
end
