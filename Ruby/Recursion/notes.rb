def upcase(str)
  return str.upcase if str.length <= 1
  str[0].upcase + upcase([1..-1])
end

def reverse(str)
  return str if str.length <= 1
  reverse(str[1..-1]) + str[0]
end

def quick_sort(arr)
  return arr if arr.length < 2
  pivot = arr.first
  left_side = arr[1..-1].select { |el| el < pivot }
  right_side = arr[1..-1].select { |el| el >= pivot }
  quick_sort(left_side) + [pivot] + quick_sort(right_side)
end