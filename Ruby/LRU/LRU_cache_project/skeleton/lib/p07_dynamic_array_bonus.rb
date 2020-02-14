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
    @store[i]
  end

  def []=(i, val)
    @count += 1 if @store[i].nil?
    @count -= 1 if val.nil?
    @store[i] = val
  end

  def capacity
    @store.length
  end

  def include?(val)
    self.each { |el| return true if el == val }
    false
  end

  def push(val)
    # debugger if val == 10
    resize! if @count >= capacity
    @store[@count] = val
    @count += 1
  end

  def unshift(val)
    @count += 1
    resize! if @count >= capacity
    # debugger
    (1...@count).to_a.reverse.each do |idx|
      @store[idx] = @store[idx - 1]
    end
    # debugger
    @store[0] = val
    # debugger
  end

  def pop
    return nil if @count == 0
    @count -= 1
    el = @store[@count]
    @store[@count] = nil
    el
  end

  def shift
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
    # ...
  end

  alias_method :<<, :push
  [:length, :size].each { |method| alias_method method, :count }

  private

  def resize!
    temp_arr = @store.dup
    @store = StaticArray.new(capacity * 2)
    (0...temp_arr.length).to_a.each do |ind|
      # debugger
      el = temp_arr[ind]
      @store[ind] = el
    end
  end
end
