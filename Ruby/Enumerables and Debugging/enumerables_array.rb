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
