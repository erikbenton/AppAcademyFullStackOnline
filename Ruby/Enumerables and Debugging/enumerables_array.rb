require "byebug"
class Array
  def my_each(&prc)
    return nil if !prc
    idx = 0
    while idx < self.length
      prc.call(self[idx])
      idx += 1
    end
    return self
  end

  def my_each_with_index(&prc)
    return nil if !prc
    idx = 0
    while idx < self.length
      prc.call(self[idx], idx)
      idx += 1
    end
    return self
  end

  def my_select(&prc)
    res = []
    self.my_each do |ele|
      res << ele if prc.call(ele)
    end
    res
  end

  def my_reject(&prc)
    res = []
    self.my_each do |ele|
      res << ele if !prc.call(ele)
    end
    res
  end

  def my_any?(&prc)
    self.my_each do |ele|
      return true if prc.call(ele)
    end
    false
  end

  def my_all?(&prc)
    self.my_each do |ele|
      return false if !prc.call(ele)
    end
    true
  end

  def my_flatten
    res = []
    self.my_each do |ele|
      if ele.is_a?(Array)
        res += ele.my_flatten
      else
        res << ele
      end
    end
    res
  end

  def my_zip(*zippers)
    res = []
    self.my_each_with_index do |ele_1, idx|
      sub_res = [ele_1]
      zippers.my_each do |sub_ele|
        if sub_ele.length - 1 < idx
          sub_res << nil
        else
          sub_res << sub_ele[idx]
        end
      end
      res << sub_res
    end
    res
  end

  def my_rotate(num=1)
    res = []
    (0...self.length).to_a.my_each do |idx|
      res << self[(idx + num) % self.length]
    end
    res
  end

  def my_join(filler=" ")
    res = ""
    (0...self.length - 1).to_a.my_each do |idx|
      res += self[idx] + filler
    end
    res += self[-1]
  end

  def my_reverse
    res = []
    (1..self.length).to_a.my_each do |idx|
      res << self[-idx]
    end
    res
  end
end

puts
puts "###############################"
puts

puts "my_each"
return_value = [1, 2, 3].my_each do |num|
  puts num
end.my_each do |num|
  puts num
end

p return_value  # => [1, 2, 3]

puts
puts "###############################"
puts

puts "my_select"
a = [1, 2, 3]
p a.my_select { |num| num > 1 } # => [2, 3]
p a.my_select { |num| num == 4 } # => []

puts
puts "###############################"
puts

puts "my_reject"
a = [1, 2, 3]
p a.my_reject { |num| num < 6 } # => [1]
p a.my_reject { |num| num % 2  == 0 } # => [1, 2, 3]

puts
puts "###############################"
puts

puts "my_any?"
p a.my_any? { |num| num > 1 } # => true
p a.my_any? { |num| num == 4 } # => false

puts
puts "###############################"
puts

puts "my_all?"
p a.my_all? { |num| num > 1 } # => false
p a.my_all? { |num| num < 4 } # => true

puts
puts "###############################"
puts

puts "my_flatten"
a = [1]
p "#{a} =?> #{[1]}"
p a.my_flatten
a = [1, 2] #=> [1, 2]
p "#{a} =?> #{[1, 2]}"
p a.my_flatten
a = [1, [2, 3]] #=> [1, 2, 3]
p "#{a} =?> #{[1, 2, 3]}"
p a.my_flatten
a = [1, 2, 3, [4, [5, 6]], [[[7]], 8]]
p "#{a} =?> #{[1, 2, 3, 4, 5, 6, 7, 8]}"
p a.my_flatten # => [1, 2, 3, 4, 5, 6, 7, 8]

puts
puts "###############################"
puts

puts "my_zip"
# a = [1]
# b = 
# p "#{a} =?> #{[1]}"
# p a.my_flatten

a = [ 4, 5, 6 ]
b = [ 7, 8, 9 ]
p [1, 2, 3].my_zip(a, b) # => [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
p a.my_zip([1,2], [8])   # => [[4, 1, 8], [5, 2, nil], [6, nil, nil]]
p [1, 2].my_zip(a, b)    # => [[1, 4, 7], [2, 5, 8]]

p c = [10, 11, 12]
p d = [13, 14, 15]
p [1, 2].my_zip(a, b, c, d)    # => [[1, 4, 7, 10, 13], [2, 5, 8, 11, 14]]

puts
puts "###############################"
puts

puts "my_rotate"

a = [ "a", "b", "c", "d" ]
p a.my_rotate         #=> ["b", "c", "d", "a"]
p a.my_rotate(2)      #=> ["c", "d", "a", "b"]
p a.my_rotate(-3)     #=> ["b", "c", "d", "a"]
p a.my_rotate(15)     #=> ["d", "a", "b", "c"]

puts
puts "###############################"
puts

puts "my_join"
a = [ "a", "b", "c", "d" ]
p a.my_join         # => "abcd"
p a.my_join("$")    # => "a$b$c$d"

puts
puts "###############################"
puts

puts "my_reverse"
p [ "a", "b", "c" ].my_reverse   #=> ["c", "b", "a"]
p [ 1 ].my_reverse               #=> [1]