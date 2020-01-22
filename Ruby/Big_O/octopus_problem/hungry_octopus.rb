require "byebug"
# Use bubble sort and get the last one
def sluggish_octopus(fish)
  sorted = false
  until sorted
    sorted = true
    first = 0
    second = 1
    while second < fish.length
      if fish[first].length > fish[second].length
        sorted = false
        fish[first], fish[second] = fish[second], fish[first]
      end
      first += 1
      second += 1
    end
  end
  fish[-1]
end

fishies = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh', "fssshhh", "trolol"]

puts sluggish_octopus(fishies.dup)

# Merge sort
def dominant_octopus(fish)
  return fish if fish.length < 2

  # Find the middle
  mid = fish.length / 2

  # Call merge sort on both sides of the midpoint
  left = fish[0...mid]
  right = fish[mid..-1]

  sorted_left = dominant_octopus(left)
  sorted_right = dominant_octopus(right)
  
  merge(sorted_left, sorted_right)
end

def merge(left, right)
  l_idx = 0
  r_idx = 0
  sorted_arr = []
  while l_idx < left.length && r_idx < right.length
    if left[l_idx].length < right[r_idx].length
      sorted_arr << left[l_idx]
      l_idx += 1
    else
      sorted_arr << right[r_idx]
      r_idx += 1
    end
  end
  sorted_arr + left[l_idx..-1] + right[r_idx..-1]
end

puts 
puts fishies
puts
p dominant_octopus(fishies)
puts
puts fishies[-1]