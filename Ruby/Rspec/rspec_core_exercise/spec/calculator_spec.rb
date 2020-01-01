RSpec.describe Calculator do
  describe '#add' do 
    it 'returns the sum of its arguments' do
      expect(Calculator.new.add(2,1)).to eq(3)
    end
  end
end