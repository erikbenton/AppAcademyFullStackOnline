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
require "byebug"

def maximum(arr, &prc)
  return nil if arr.empty?
  largest = prc.call(arr[0])
  res = arr[0]
  arr.each do |ele|
    sub_res = prc.call(ele)
    if sub_res >= largest
      res = ele
      largest = sub_res
    end
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
  max_ele = maximum(arr, &prc_2)
  max_res = prc_2.call(max_ele)
  groups = my_group_by(arr, &prc_2)
  if groups[max_res].length > 1
    max_ele = maximum(groups[max_res], &prc_1)
    max_res = prc_1.call(max_ele)
    groups = my_group_by(arr, &prc_1)
    if groups[max_res].length > 1
      return first_satisfy(arr, max_res, prc_1)
    end
  end
  max_ele
end

def first_satisfy(arr, val, prc)
  arr.each do |ele|
    return ele if prc.call(ele) == val
  end
end

def silly_syllables(sentence)
  vowels = "aeiou"
  num_vowels = sentence.split("").count { |ele| vowels.include?(ele) }
  if num_vowels < 2
    return sentence
  end
  words = sentence.split.map { |word| silly_words(word) }
  words.join(" ")
end

def silly_words(word)
  vowels = "aeiou"
  num_vowels = word.split("").count { |ele| vowels.include?(ele) }
  if num_vowels < 2
    return word
  end
  first = 0
  last = -1
  word.split("").each_with_index do |ele, idx|
    if vowels.include?(ele)
      first = idx
      break
    end
  end
  word.split("").reverse.each_with_index do |ele, idx|
    if vowels.include?(ele)
      last = word.length - idx
      break
    end
  end
  word[first...last]
end