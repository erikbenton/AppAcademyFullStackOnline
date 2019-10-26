# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.

require "byebug"

def prime?(num)
  return false if num < 2

  (2...num).each do |factor|
    if num % factor == 0
        return false
    end
  end
  true
end

def largest_prime_factor(number)
  (1..number).reverse_each do |num|
    # debugger
    if number % num == 0
      return num if prime?(num)
    end
  end
  1
end

def unique_chars?(str)
  char_count = Hash.new { |hash, key| hash[key] = 0 }
  str.each_char { |char| char_count[char] += 1 }
  char_count.each do |key, val|
    return false if val > 1
  end
  true
end

def dupe_indices(arr)
  dupes = Hash.new { |hash, key| hash[key] = [0, []] }
  arr.each_with_index do |ele, idx| 
    dupes[ele][0] += 1
    dupes[ele][1].push(idx)
  end
  dupes.each do |key, val|
    if val[0] < 2
      dupes.delete(key)
    else
      dupes[key] = val[1]
    end
  end
  dupes
end

def ele_count(arr)
  ele_count = Hash.new { |hash, key| hash[key] = 0 }
  arr.each do |ele| 
    ele_count[ele] += 1
  end
  ele_count
end

def ana_array(arr_1, arr_2)
  ele_count(arr_1) == ele_count(arr_2)
end