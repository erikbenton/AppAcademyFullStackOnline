class Queue
  def initialize
    @queue = []
  end

  def enqueue(*el)
    return unless el
    el.each { |e| @queue.unshift(e) }
  end

  def dequeue
    return if @queue.empty?
    @queue.pop
  end

  def peek
    return if @queue.empty?
    @queue[-1]
  end
end

if __FILE__ == $PROGRAM_NAME
  queue = Queue.new
  p queue
  queue.enqueue(5)
  p queue.peek
  queue.enqueue("yup", "again")
  p queue
  p queue.dequeue
  p queue
  p queue.peek
end