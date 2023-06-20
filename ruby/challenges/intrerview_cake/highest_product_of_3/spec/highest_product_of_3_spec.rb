require './highest_product_of_3'

describe 'exercise' do
  context 'when the input contains only positive numbers' do
    it "returns the correct result" do
      input = [1, 10, 3, 4]
      expect(exercise(input)).to eq 120
    end
  end

  context 'when the input contains one negative number' do
    it "returns the correct result" do
      input = [1, 10, 3, 4, -10]
      expect(exercise(input)).to eq 120
    end
  end

  context 'when the input contains small negative numbers' do
    it "returns the correct result" do
      input = [0, -10, -10, 1, 3, -9]
      expect(exercise(input)).to eq 300
    end
  end

  context 'when the input contains less than 3 numebrs' do
    it "should raise an exception" do
      input = [0, -10]
      expect{exercise(input)}.to raise_error(Exception)
    end
  end
end