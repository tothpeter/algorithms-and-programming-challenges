require './challenge3_max_product_of_three'

describe 'solution1' do
  context 'when the best is using the 3 biggest number' do
    it 'it returns the value of the maximal product of any triplet' do
      input = [ -3, 1, 2, -2, 5, 6 ]
      expected_output = 60

      output = solution1 input

      expect(output).to eq(expected_output)
    end
  end

  context 'when the best is using 2 negative number' do
    it 'it returns the value of the maximal product of any triplet' do
      input = [ -2, -1, 1, 2 ]
      expected_output = 4

      output = solution1 input

      expect(output).to eq(expected_output)
    end
  end
end

describe 'solution2' do
  context 'when the best is using the 3 biggest number' do
    it 'it returns the value of the maximal product of any triplet' do
      input = [ -3, 1, 2, -2, 5, 6 ]
      expected_output = 60

      output = solution2 input

      expect(output).to eq(expected_output)
    end
  end

  context 'when the best is using 2 negative number' do
    it 'it returns the value of the maximal product of any triplet' do
      input = [ -2, -1, 1, 2 ]
      expected_output = 4

      output = solution2 input

      expect(output).to eq(expected_output)
    end
  end
end
