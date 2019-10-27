def select_even_nums(nums)
  nums.select(&:even?)
end

def reject_puppies(doggos)
  doggos.reject { |doggo| doggo["age"] < 3 }
end

def count_positive_subarrays(arr)
  arr.count do |sub_arr|
    sum = 0
    sub_arr.each { |ele| sum += ele }
    sum > 0
  end
end

def aba_translate(word)
  vowels = "aeiou".split("")
  idx = 0
  while idx < word.length
    if vowels.include?(word[idx])
      word.insert(idx + 1, "b" + word[idx])
      idx += 2
    end
    idx += 1
  end
  word
end

def aba_array(arr)
  arr.map { |word| aba_translate(word) }
end