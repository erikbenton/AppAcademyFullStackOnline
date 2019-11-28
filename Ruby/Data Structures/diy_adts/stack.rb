class Stack
  def initialize
    @stack = []
  end

  def push(*el)
    return unless el
    el.each { |e| @stack.push(e) }
    # @stack.push(el)
  end

  def pop
    @stack.pop
  end

  def peek
    @stack[0]
  end
end

if __FILE__ == $PROGRAM_NAME
  stack = Stack.new
  p stack
  stack.push(9)
  stack.push("hello", [32, 7, "lols"])
  p stack
  p stack.pop
  p stack.peek
  p stack.pop
  stack.pop
  stack.pop
  stack.pop
  p stack
end