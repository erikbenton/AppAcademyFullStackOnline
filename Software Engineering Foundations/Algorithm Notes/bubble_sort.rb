def bubble_sort(arr)
  swap = true
  while swap
    swap = false
    (0...arr.length - 1).each do |idx|
      if arr[idx] > arr[idx + 1]
        arr[idx], arr[idx + 1] = arr[idx + 1], arr[idx]
        swap = true
      end
    end
  end
  return arr
end

p bubble_sort([2,8,5,2,6]) # => [2, 2, 5, 6, 8]