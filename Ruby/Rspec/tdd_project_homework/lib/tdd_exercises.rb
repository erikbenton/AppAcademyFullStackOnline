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
    dim = self[0].length
    transp = []
    dim.times { transp << [] }
    (0...self.length).each do |row|
      self[row].each_with_index do |val, col|
        transp[col][row] = val
      end
    end
    transp
  end
end

def stock_picker(stocks)
  raise "not enough days of stocks" if stocks.length < 2
  raise "invalid stock prices" unless stocks.all? { |el| el.is_a?(Numeric) }
  best_pair = [0, 1]
  (0...stocks.length).each do |first_day|
    ((first_day + 1)...stocks.length).each do |next_day|
      if (stocks[next_day] - stocks[first_day]) > stocks[best_pair[1]] - stocks[best_pair[0]]
        best_pair = [first_day, next_day]
      end
    end
  end
  best_pair
end