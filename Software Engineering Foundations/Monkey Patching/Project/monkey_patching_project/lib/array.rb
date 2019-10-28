# Monkey-Patch Ruby's existing Array class to add your own custom methods
require "byebug"

class Array
  def span
    return nil if self.empty?
    self.max - self.min
  end

  def average
    return nil if self.empty?
    self.sum / self.length.to_f if self.all? { |ele| ele.is_a?(Numeric)}
  end

  def average_elements(ele_1, ele_2)
    (ele_1 + ele_2) / 2.0
  end

  def median
    return nil if self.empty?
    sorted = self.sort
    if sorted.length % 2 == 1
      return sorted[sorted.length/2] 
    end
    average_elements(sorted[sorted.length/2 - 1], sorted[sorted.length/2]) 
  end

  def counts
    letter_count = Hash.new { |h, k| h[k] = 0 }
    self.each { |ele| letter_count[ele] += 1 }
    letter_count
  end

  def my_count(val)
    count = 0
    self.each { |ele| count += 1 if ele == val }
    count
  end

  def my_index(val)
    self.each_with_index { |ele, idx| return idx if ele == val }
    nil
  end

  def my_uniq
    uniqs = []
    self.each { |ele| uniqs << ele if !uniqs.include?(ele) }
    uniqs
  end

  def my_transpose
    (0...self.length).each do |idx1|
      (idx1...self.length).each do |idx2|
        self[idx1][idx2], self[idx2][idx1] = self[idx2][idx1], self[idx1][idx2]
      end
    end
    self
  end
end