require_relative "min_max_stack.rb"

class MinMaxStackQueue
  def initialize
    @push_stack = MinMaxStack.new
    @pop_stack = MinMaxStack.new
  end

  def enqueue(val)
    @push_stack.push(val)
  end

  def dequeue
    until @push_stack.empty?
      @pop_stack.push(@push_stack.pop)
    end
    val = @pop_stack.pop
    until @pop_stack.empty?
      @push_stack.push(@pop_stack.pop)
    end
    val
  end

  def empty?
    @push_stack.empty?
  end

  def size
    @push_stack.size
  end

  def min
    @push_stack.min
  end

  def max
    @push_stack.max
  end
end
