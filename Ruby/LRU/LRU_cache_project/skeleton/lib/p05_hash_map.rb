require_relative 'p04_linked_list'

class HashMap
  include Enumerable
  attr_accessor :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { LinkedList.new }
    @count = 0
  end

  def include?(key)
    get_bucket(key).include?(key)
  end

  def set(key, val)
    resize! if @count >= num_buckets
    bucket = get_bucket(key)
    if bucket.include?(key)
      bucket.update(key, val)
    else
      bucket.append(key, val)
      @count += 1
    end
  end

  def get(key)
    get_bucket(key).get(key)
  end

  def delete(key)
    @count -= 1 unless get_bucket(key).remove(key).nil?
    @count = 0 if @count < 0
  end

  def each
    @store.each do |bucket|
      bucket.each do |node|
        yield(node.key, node.val)
      end
    end
  end

  # uncomment when you have Enumerable included
  def to_s
    pairs = inject([]) do |strs, (k, v)|
      strs << "#{k.to_s} => #{v.to_s}"
    end
    "{\n" + pairs.join(",\n") + "\n}"
  end

  alias_method :[], :get
  alias_method :[]=, :set

  private

  def num_buckets
    @store.length
  end

  def resize!
    temp_store = @store.dup
    @store = Array.new(num_buckets * 2) { LinkedList.new }
    @count = 0
    temp_store.each do |bucket|
      bucket.each { |node| self.set(node.key, node.val) }
    end
  end

  def get_bucket(key)
    # optional but useful; return the bucket corresponding to `key`
    index = key.hash % num_buckets
    @store[index]
  end
end