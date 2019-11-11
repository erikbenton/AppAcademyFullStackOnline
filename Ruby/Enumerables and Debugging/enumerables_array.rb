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