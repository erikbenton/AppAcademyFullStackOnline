class MinMaxStack
  def initialize
    @store = []
    @max = nil
    @min = nil
  end

  def pop
    @store.pop
  end

  def push(val)
    @store.push(val)
    @max = val if @max.nil? || @max < val
    @max = val if @min.nil? || @min > val
  end

  def peek
    @store[-1]
  end

  def size
    @store.length
  end

  def empty?
    @store.empty?
  end

  def max
    @max
  end

  def min
    @min
  end
end