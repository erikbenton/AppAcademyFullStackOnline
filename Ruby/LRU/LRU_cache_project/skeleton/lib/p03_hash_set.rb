class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    resize! if @count >= num_buckets
    return false if include?(key)
    bucket = self[key.hash]
    bucket << key
    @count += 1
    true
  end

  def include?(key)
    bucket = self[key.hash]
    bucket.include?(key)
  end

  def remove(key)
    return unless include?(key)
    bucket = self[key.hash]
    bucket.delete(key)
    @count -= 1
    @count = 0 if @count < 0
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    num %= num_buckets
    @store[num]
  end

  def num_buckets
    @store.length
  end

  def resize!
    temp_store = @store.dup
    @store = Array.new(num_buckets * 2) { Array.new }
    temp_store.flatten.each do |num|
      bucket = self[num]
      bucket << num
    end
  end
end