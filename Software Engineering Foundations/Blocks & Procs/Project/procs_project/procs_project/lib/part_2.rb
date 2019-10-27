def reverser(str, &prc)
  new_str = ""
  str.each_char { |char| new_str = char + new_str }
  prc.call(new_str)
end

def word_changer(sentence, &prc)
  new_words = []
  sentence.split.each { |word| new_words << prc.call(word)}
  new_words.join(" ")
end

def greater_proc_value(num, prc_1, prc_2)
  res_1 = prc_1.call(num)
  res_2 = prc_2.call(num)
  if res_1 > res_2
    return res_1
  else
    return res_2
  end
end

def and_selector(arr, prc_1, prc_2)
  res = []
  arr.each { |ele| res << ele if prc_1.call(ele) && prc_2.call(ele) }
  res
end

def alternating_mapper(arr, prc_1, prc_2)
  res = []
  arr.each_with_index do |ele, idx|
    if idx % 2 == 0
      res << prc_1.call(ele)
    else
      res << prc_2.call(ele)
    end
  end
  res
end