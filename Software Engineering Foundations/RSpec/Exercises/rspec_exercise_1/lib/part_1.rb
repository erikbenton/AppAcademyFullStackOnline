def average(num1, num2)
  (num1 + num2) / 2.0
end

def average_array_me(arr)
  sum = arr.inject { |sum, el| sum += el }
  sum / arr.length.to_f
end

# After watching solutions
def average_array(arr)
  arr.sum/arr.length.to_f
end

def repeat(str, num)
  str * num # Must be (str * num) NOT (num * str)
end

def yell(str)
  str.upcase + "!"
end

def alternating_case(sentence)
  words = sentence.split
  words.each_with_index do |word, idx|
    if idx % 2 == 0
      word.upcase!
    else
      word.downcase!
    end
  end
  words.join(" ")
end