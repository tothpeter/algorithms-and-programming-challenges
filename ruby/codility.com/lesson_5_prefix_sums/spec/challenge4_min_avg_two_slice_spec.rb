require './challenge4_min_avg_two_slice'

describe 'solution' do
  describe 'example1' do
    it 'returns the correct first index' do
      input = [ 4, 2, 2, 5, 1, 5, 8 ]
      expected_output = 1

      output = solution input

      expect(output).to eq(expected_output)
    end
  end

  context 'when the 2nd pair has lower avg than the first' do
    it 'returns the correct first index' do
      input = [ -18, -1, -19 ]
      # (-1-18)/2 = -9.5
      # (-1-19)/2 = -10
      # (-18-1-19)/3 = -12.66

      expected_output = 0

      output = solution input

      expect(output).to eq(expected_output)
    end
  end

  context 'when the input is medium range' do
    it 'returns the correct first index' do
      input = [-3, -3, 10, -10, 10, -10, 10, -10, 10, -3, -3, 100, -11]

      expected_output = 3

      output = solution input

      expect(output).to eq(expected_output)
    end
  end

  context 'when the earlier triple is better' do
    it 'returns the correct first index' do
      input = [-2, -1, -3, 5, 5, -4, 0]

      expected_output = 0

      output = solution input

      expect(output).to eq(expected_output)
    end
  end
end
