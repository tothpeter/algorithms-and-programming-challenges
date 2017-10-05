require './2_triangle'

describe 'solution' do
  describe 'positive cases' do
    it 'returns 1' do
      input = [ 10, 2, 5, 1, 8, 20 ]
      expected_output = 1

      output = solution input

      expect(output).to eq(expected_output)
    end

    it 'returns 1' do
      input = [ 10, 0, -10, 2, 5, 5, 1, 8, 20 ]
      expected_output = 1

      output = solution input

      expect(output).to eq(expected_output)
    end
  end

  describe 'negative cases' do
    it 'returns 0' do
      input = [ 10, 50, 5, 1 ]
      expected_output = 0

      output = solution input

      expect(output).to eq(expected_output)
    end

    it 'returns 0' do
      input = [ 1, 2, 3 ]
      expected_output = 0

      output = solution input

      expect(output).to eq(expected_output)
    end

    it 'returns 0' do
      input = [ 11, 20, 3 ]
      expected_output = 0

      output = solution input

      expect(output).to eq(expected_output)
    end
  end

  context 'when the input array contians less than 3 items' do
    it 'returns 0' do
      input = [ 10, 50 ]
      expected_output = 0

      output = solution input

      expect(output).to eq(expected_output)
    end
  end
end
