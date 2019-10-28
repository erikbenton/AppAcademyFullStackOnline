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
    mid_index = sorted.length / 2
    if sorted.length.odd?
      return sorted[mid_index] 
    end
    average_elements(sorted[mid_index - 1], sorted[mid_index]) 
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
    uniqs = Hash.new(true)
    self.each { |ele| uniqs[ele] = true }
    uniqs.keys
  end

  def my_transpose
    new_arr = self
    (0...self.length).each do |row|
      (row...self.length).each do |col|
        new_arr[row][col], new_arr[col][row] = self[col][row], self[row][col]
      end
    end
    new_arr
  end

  def my_transpose_2
    new_arr = []
    (0...self.length).each do |row|
      new_row = []
      (0...self.length).each do |col|
        row << self[col][row]
        # new_arr[row][col], new_arr[col][row] = self[col][row], self[row][col]
      end
      new_arr << new_row
    end
    new_arr
  end
end