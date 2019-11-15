# def zip(*arrs)
#   if arrs.any? { |arr| arr.length != arrs[0].length }
#     raise "Arrays must be the same length"
#   end
#   res = []
#   (0...arrs[0].length).each do |idx|
#     sub_res = []
#     arrs.each do |sub_arr|
#       sub_res << sub_arr[idx]
#     end
#     res << sub_res
#   end
#   res
# end

def zip(*arrs)
  length = arrs[0].length
  if arrs.any? { |arr| arr.length != length }
    raise "Arrays must be the same length"
  end
  res = Array.new(length) { [] }
  flattened = arrs.flatten
  (0...flattened.length).each do |idx|
    res[idx % length] << flattened[idx]
  end
  res
end

def prizz_proc(arr, prc_1, prc_2)
  res = []
  arr.each do |ele|
    res << ele if prc_1.call(ele) != prc_2.call(ele)
  end
  res
end

def zany_zip(*arrs)
  res = []
  lengths = arrs.map { |arr| arr.length }
  length = lengths.max
  (0...length).each do |idx|
    sub_res = []
    arrs.each do |sub_arr|
      sub_res << sub_arr[idx]
    end
    res << sub_res
  end
  res
end

def maximum(arr, &prc)
  return nil if arr.empty?
  largest = prc.call(arr[0])
  res = arr[0]
  arr.each do |ele|
    sub_res = prc.call(ele)
    res = ele if sub_res >= largest
  end
  res
end

def my_group_by(arr, &prc)
  res = Hash.new { |h, k| h[k] = [] }
  arr.each do |ele|
    res[prc.call(ele)] << ele
  end
  res
end

def max_tie_breaker(arr, prc_1, &prc_2)
  return nil if arr.empty?
  res = maximum(arr, &prc_2)
  res
end