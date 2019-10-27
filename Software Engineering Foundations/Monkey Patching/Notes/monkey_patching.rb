# Monkey Patching - Adding additional methods to an existing class
#
# Ruby Types are really classes: Integer, String, Array, Hash, etc..

class String
  def upcase?
    self == self.upcase
  end
end

p "hello".upcase? # false
p "HELLO".upcase? # true

class Integer
  def prime?
    return false if self < 2
    (2...self).none? { |div| self % div == 0 }
  end
end

p "Is #{7} a prime? #{7.prime?}" # true
p "Is #{11} a prime? #{11.prime?}" # true
p "Is #{22} a prime? #{22.prime?}" # false
p "Is #{0} a prime? #{0.prime?}" # false

class Array
  def has_zero?
    self.include?(0)
  end
end

p "Does #{[1,2,3,0]} have a zero? #{[1,2,3,0].has_zero?}"
p "Does #{[1,2,3,6]} have a zero? #{[1,2,3,6].has_zero?}"