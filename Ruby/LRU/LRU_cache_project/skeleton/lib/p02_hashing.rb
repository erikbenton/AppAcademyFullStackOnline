class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    num = 0
    self.each do |ele|
      num ^= (num + ele)
    end
    num
  end
end

class String
  def hash
    letters = self.split("").map { |char| char.ord }
    letters.hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    num = 0
    self.each_pair do |k, v|
      num ^= k.hash + v.hash
    end
    num
  end
end
