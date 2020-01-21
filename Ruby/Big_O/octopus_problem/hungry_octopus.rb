# Use bubble sort and get the last one
def sluggish_octopus(fish)
  sorted = false
  while !sorted
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

fishies = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh'];

puts sluggish_octopus(fishies)