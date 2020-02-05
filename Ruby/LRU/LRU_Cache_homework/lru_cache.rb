class LRUCache
  def initialize(size)
    @size = size
    @store = []
  end

  def count
    @store.count { |el| !el.nil? }
  end

  def add(el)
    # Delete el if it's in the store
    @store.delete(el) if @store.include?(el)
    @store.push(el) # Add to store
    @store = @store.drop(@size) if count > @size
  end

  def show
    p @store
  end
end

if __FILE__ == $PROGRAM_NAME
  johnny_cache = LRUCache.new(4)

  johnny_cache.add("I walk the line")
  johnny_cache.add(5)

  puts johnny_cache.count # => returns 2

  johnny_cache.add([1,2,3])
  johnny_cache.add(5)
  johnny_cache.add(-5)
  johnny_cache.add({a: 1, b: 2, c: 3})
  johnny_cache.add([1,2,3,4])
  johnny_cache.add("I walk the line")
  johnny_cache.add(:ring_of_fire)
  johnny_cache.add("I walk the line")
  johnny_cache.add({a: 1, b: 2, c: 3})


  johnny_cache.show # => prints [[1, 2, 3, 4], :ring_of_fire, "I walk the line", {:a=>1, :b=>2, :c=>3}]

end