# Sets
  # Set Ints
# Resizing Int Set
  # Approaching O(1)
# How a Hash is formed

# ========
#  Hashes
# ========

# Deterministic
# Uniform 
# Highly-sensitive
# Ideally non reverse-engineerable

# Types of functions
  # Fast hashing fns
    # Cityhash
    # CRC32
    # Mumurhash
  # Cryptographic
    # MD5 - Bad
    # SHA2
    # Blowfish

# Every object in Ruby has a Object#hash method to be "hashable"

# ==========
#  Hash Set
# ==========

# {2, 4, 6,8, 16, "hello", "dolly"}
#  [ [], [], [], [] ]

# Mod each hash value for each object

# 2.hash -> 7928567 -> 7928567 % 4 = 3
# [ [], [], [], [2] ]

# 4.hash -> 8925562 -> 8925562 % 4 = 2
# [ [], [], [4], [2] ]

# 8.hash -> 123456 -> 123456 % 4 = 0
# [ [8], [], [4], [2] ]

# 16.hash -> 123457 -> 123457 % 4 = 1
# [ [8], [16], [4], [2] ]

# Expand n -> 2n --> 4 -> 8
# 2.hash % 8 -> 1
# 4.hash % 8 -> 6
# 8.hash % 8 -> 7
# 16.hash % 8 -> 2
# "hello".hash % 8 -> 1
# "dolly".hash % 8 -> 6
# [ [], [2, "hello"], [16], [], [], [], [4, "dolly"], [8] ]

# ==============
#  Linked Lists
# ==============

# Singly-Linked-List
  # Head
  # Tail
  # Nodes
    # Parent
    # Child/Next
    # Value

# Find -> O(n)
# Push -> O(n) -> O(1)
# Unshifting -> O(1)

# Doubly-Linked_List
  # prev

# ==========
#  Hash Map
# ==========

# { 1 => 1, 2 => 4, 3 => 9, 5 => 25 }
#  [ 
  # LL
  # LL
  # LL
  # LL 
# ]

# 1.hash % 4 = 2
# 2.hash % 4 = 0
# 3.hash % 4 = 1
# 5.hash % 4 = 1
#  [ 
  # LL -> [2,4]
  # LL -> [3,9] -> [5,25]
  # LL -> [1,1]
  # LL
# ]

# =========
#  Caching 
# =========

# Think about Super Mario Bros. lol
# Wanna be able to cache objects in the game
# because we can't save EVERYTHING to memory

# LRU - Least Recently Used
# heuristic used to determine what stays in the cache
# Need to store info for when the object was last used
# Or use a Linked List since that is ordered

# LL => [mario, bowser, goomba]

# {
  # "mario" => LL[0]
  # "bowser" => LL[1]
  # "goomba" => LL[2] 
# }

# eject -> use LL method of ejecting tail/head O(1)
# insert -> Use LL method to put at head/tail O(1)
# read -> Use hash map read O(1)