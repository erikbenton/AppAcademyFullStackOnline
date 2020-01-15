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
end