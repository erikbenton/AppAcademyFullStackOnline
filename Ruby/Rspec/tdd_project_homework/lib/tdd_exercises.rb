class Array
  def my_uniq
    uniqs = []
    self.each do |el|
      uniqs << el unless uniqs.include?(el)
    end
    uniqs
  end

  def two_sum
    sums = []
    (0...self.length).each do |idx_1|
      ((idx_1 + 1)...self.length).each do |idx_2|
        sums << [idx_1, idx_2] if self[idx_1] + self[idx_2] == 0
      end
    end
    sums
  end

  def my_transpose
    dim = self.length
    raise "not a square matrix" if self.any? { |row| row.length != dim }
    transp = []
    dim.times { transp << [] }
    (0...dim).each do |row|
      self[row].each_with_index do |val, col|
        transp[col][row] = val
      end
    end
    transp
  end
end