class StaticArray
  attr_reader :store

  def initialize(capacity)
    @store = Array.new(capacity)
  end

  def [](i)
    validate!(i)
    self.store[i]
  end

  def []=(i, val)
    validate!(i)
    self.store[i] = val
  end

  def length
    self.store.length
  end

  private

  def validate!(i)
    raise "Overflow error" unless i.between?(0, self.store.length - 1)
  end
end

class DynamicArray
  include Enumerable
  attr_accessor :count

  def initialize(capacity = 8)
    @store = StaticArray.new(capacity)
    @count = 0
  end

  def [](i)
    return @store[i] unless i < 0
    ind = @count + i
    return nil if ind < 0 || ind >= @count
    return @store[ind]
  end

  def []=(i, val)
    if i > @count
      start = @count
      (start...i).to_a.each do |idx|
        self.push(nil)
      end
      self.push(val)
    else
      i = @count + i if i < 0
      return nil if i < 0 || i >= @count
      @count += 1 if @store[i].nil?
      @count -= 1 if val.nil?
      @store[i] = val
    end
  end

  def capacity
    @store.length
  end

  def include?(val)
    self.each { |el| return true if el == val }
    false
  end

  def push(val)
    resize! if @count >= capacity
    @store[@count] = val
    @count += 1
  end

  def unshift(val)
    @count += 1
    resize! if @count >= capacity
    (1...@count).to_a.reverse.each do |idx|
      @store[idx] = @store[idx - 1]
    end
    @store[0] = val
  end

  def pop
    return nil if @count == 0
    @count -= 1
    el = @store[@count]
    @store[@count] = nil
    el
  end

  def shift
    return nil if @count < 1
    el = @store[0]
    (0...(@count - 1)).to_a.each do |idx|
      @store[idx] = @store[idx + 1]
    end
    @count -= 1
    @store[@count] = nil
    el
  end

  def first
    @store[0]
  end

  def last
    return @store[0] if @count < 1
    @store[@count - 1]
  end

  def each
    (0...@count).to_a.each do |idx|
      yield(@store[idx])
    end
  end

  def to_s
    "[" + inject([]) { |acc, el| acc << el }.join(", ") + "]"
  end

  def ==(other)
    return false unless [Array, DynamicArray].include?(other.class)
    (0...@count).to_a.each do |idx|
      return false if @store[idx] != other[idx]
    end
    true
  end

  alias_method :<<, :push
  [:length, :size].each { |method| alias_method method, :count }

  private

  def resize!
    temp_arr = @store.dup
    @store = StaticArray.new(capacity * 2)
    (0...temp_arr.length).to_a.each do |ind|
      el = temp_arr[ind]
      @store[ind] = el
    end
  end
end
