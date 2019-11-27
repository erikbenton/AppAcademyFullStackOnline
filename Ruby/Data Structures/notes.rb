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
#     queue = [root]
#     until queue.empty?
#       el = queue.shift
#       process!(el)
#       el.children.each do |child|
#         queue << child
#       end
#     end
# DFS - Depth First Search
#   Straight to the bottom