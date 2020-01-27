class MinMaxStack
  def initialize
    @store = []
    @max = nil
    @min = nil
  end

  def pop
    val = @store.pop
    if @store.empty?
      @max = nil
      @min = nil
    end
    val
  end

  def push(val)
    @store.push(val)
    @max = val if @max.nil? || @max < val
    @min = val if @min.nil? || @min > val
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