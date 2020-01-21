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

fishies = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh', "fssshhh"];

puts sluggish_octopus(fishies.dup)

# Merge sort
def dominant_octopus(fish)
  return fish if fish.length < 2

  # Find the middle
  mid = fish.length / 2

  # Call merge sort on both sides of the midpoint
  left= fish[0...mid]
  right = fish[mid..-1]

  sorted_left, sorted_right = dominant_octopus(left), dominant_octopus(right)
  merge(left, right)
end

def merge(left, right)
  sorted_arr = []
  until left.empty? || right.empty?
    if left.first.length < right.first.length
      sorted_arr << left.shift
    else
      sorted_arr << right.shift
    end
  end
  left + sorted_arr + right
end

puts 
puts fishies
puts
puts dominant_octopus(fishies)
puts
puts fishies[-1]