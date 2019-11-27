# Data Structures
#   Array
#   Hash
#   Class

# Abstract Data Types
#   Set
#     - include?
#     - <<
#     - delete
# Can be implemented by an Array [3, "Hi"]
# Would say that the Set is implemented by an Array
# Can also use Hash { 3 => true, "hello" => true }
#   Map/Dictionary
#     - set
#     - get
#     - delete

# How the ADT is implemented matters, but what is most important is that
# it fulfills its requirements

# Stack
# LIFO - Last In, First Out
# Usually implemented by an Array

# Queue
# FIFO - First In, First Out
# Enqueue and dequeue

# Tree
# Binary Tree - <= 2 children per node
# Ternary Tree - <= 4 children per node
# n-ary or polytree - <= n children per node
# Nodes/Vertices, Parents/Children, root/leaves, depth
# MUST HAVE DIRECTION

# BFS - Breadth First Search
#   Start with root node
  def BFS(target)
    queue = [root]
    until queue.empty?
      el = queue.shift
      return el if el.val == target
      el.children.each do |child|
        queue << child
      end
    end
  end

# DFS - Depth First Search
#   Straight to the bottom
#   Base case: root.nil? -> return nil
#              root.val == target -> return root
#   Inductive Step: If I DFS on left-side or right-side, it has to be in either
def dfs(root, target)
  return nil if root.nil?
  return root if root.val == target
  root.children.each do |child|
    search_res = dfs(child, target)
    return search_res unless search_res.nil?
  end
  nil
end