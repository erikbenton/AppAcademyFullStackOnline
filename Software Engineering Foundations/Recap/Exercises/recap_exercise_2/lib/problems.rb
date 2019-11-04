# Write a method, least_common_multiple, that takes in two numbers and returns
# the smallest number that is a mutiple of both of the given numbers
def least_common_multiple(num_1, num_2)
  ans = num_1
  while ans % num_1 != 0 or ans % num_2 != 0
    ans += 1
  end
  ans
end


# Write a method, most_frequent_bigram, that takes in a string and returns the two adjacent letters that appear the
# most in the string.
def most_frequent_bigram(str)
  bigram_counter = Hash.new { |h, k| h[k] = 0 }
  bigrams = []
  (0...(str.length)).each do |idx_1|
    bigrams << str[idx_1...(idx_1 + 2)] if str[idx_1...(idx_1 + 2)].length == 2
  end
  bigrams.each { |bigram| bigram_counter[bigram] += 1 if str.include?(bigram) }
  bigram_counter.max_by { |k, v| v }[0]
end

class Hash
    # Write a method, Hash#inverse, that returns a new hash where the key-value pairs are swapped
    def inverse
      new_hash = {}
      self.map { |k, v| new_hash[v] = k }
      new_hash
    end
end

require "byebug"
class Array
    # Write a method, Array#pair_sum_count, that takes in a target number
    # returns the number of pairs of elements that sum to the given target
    def pair_sum_count(num)
      count = 0
      (0...self.length).each do |idx_1|
        (idx_1...self.length).each do |idx_2|
          count += 1 if self[idx_1] + self[idx_2] == num
        end
      end
      count
    end

    # Write a method, Array#bubble_sort, that takes in an optional proc argument.
    # When given a proc, the method should sort the array according to the proc.
    # When no proc is given, the method should sort the array in increasing order.
    #
    # Sorting algorithms like bubble_sort, commonly accept a block. That block accepts
    # two parameters, which represents the two elements in the array being compared.
    # If the block returns 1, it means that the second element passed to the block
    # should go before the first (i.e. switch the elements). If the block returns -1,
    # it means the first element passed to the block should go before the second
    # (i.e. do not switch them). If the block returns 0 it implies that
    # it does not matter which element goes first (i.e. do nothing).
    #
    # This should remind you of the spaceship operator! Convenient :)
    def bubble_sort(&prc)
      prc ||= Proc.new { |a, b| a <=> b }
      still_sorting = true
      while still_sorting
        still_sorting = false
        (0...self.length - 1).each do |idx|
          if prc.call(self[idx], self[idx + 1]) == 1
            self[idx], self[idx + 1] = self[idx + 1], self[idx]
            still_sorting = true
          end
        end
      end
      self
    end
end
