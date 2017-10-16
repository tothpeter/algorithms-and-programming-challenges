# Given a smaller and a bigger string, find all permutations of the shorter string within the longer one. Return the location of each permutation

require './permutations'

describe '#solution1' do
  describe 'simple case 1' do
    it 'returns the location of each permutation' do
      input_a = 'ab'
      input_b = 'bacab'
      expected_output = [ [ 0, 1 ], [ 3, 4 ] ]

      expect(solution1(input_a, input_b)).to eq(expected_output)
    end
  end

  describe 'simple case 2, when two permutation overlap' do
    it 'returns the location of each permutation' do
      input_a = 'ab'
      input_b = 'babcab'
      expected_output = [ [ 0, 1 ], [ 1, 2 ], [ 4, 5 ] ]

      expect(solution1(input_a, input_b)).to eq(expected_output)
    end
  end

  describe 'simple case 3' do
    it 'returns the location of the one permutation' do
      input_a = 'abc'
      input_b = 'abdcba'
      expected_output = [ [ 3, 5 ] ]

      expect(solution1(input_a, input_b)).to eq(expected_output)
    end
  end

  describe 'simple case 4, full match' do
    it 'returns the location of the one permutation' do
      input_a = 'abcd'
      input_b = 'abcd'
      expected_output = [ [ 0, 3 ] ]

      expect(solution1(input_a, input_b)).to eq(expected_output)
    end
  end

  describe 'when there is no permutation' do
    it 'returns empty array' do
      input_a = 'ab'
      input_b = 'cd'
      expected_output = []

      expect(solution1(input_a, input_b)).to eq(expected_output)
    end
  end
end
