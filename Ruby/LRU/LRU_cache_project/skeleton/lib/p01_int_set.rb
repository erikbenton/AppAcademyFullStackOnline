class MaxIntSet
  attr_reader :store
  def initialize(max)
    @store = Array.new(max, false)
  end

  def insert(num)
    is_valid?(num)
    @store[num] = true
  end

  def remove(num)
    is_valid?(num)
    @store[num] = false
  end

  def include?(num)
    return false if @store[num].nil?
    @store[num]
  end

  private

  def is_valid?(num)
    raise "Out of bounds" unless validate!(num)
  end

  def validate!(num)
    num.between?(0, store.length - 1)
  end
end


class IntSet
  attr_reader :store
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    return false if include?(num)
    bucket = self[num]
    bucket << num
    true
  end

  def remove(num)
    bucket = self[num]
    bucket.delete(num)
  end

  def include?(num)
    bucket = self[num]
    bucket.include?(num)
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
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    resize! if @count >= num_buckets
    return false if include?(num)
    bucket = self[num]
    bucket << num
    @count += 1
    true
  end

  def remove(num)
    return unless include?(num)
    bucket = self[num]
    bucket.delete(num)
    @count -= 1
    @count = 0 if @count < 0
  end

  def include?(num)
    bucket = self[num]
    bucket.include?(num)
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
