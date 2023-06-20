require './4_max_counters'

describe 'solution1' do
  describe 'first rule' do
    it 'increases the required counters' do
      counters_count = 5
      operations     = [ 3, 4, 4 ]

      expected_output = [ 0, 0, 1, 2, 0 ]

      expect(solution1(counters_count, operations)).to eq(expected_output)
    end
  end

  describe 'second rule' do
    it 'sets all coutners to the max' do
      counters_count = 5
      operations     = [ 4, 4, 4, 6 ]

      expected_output = [ 3, 3, 3, 3, 3 ]

      expect(solution1(counters_count, operations)).to eq(expected_output)
    end
  end

  describe 'comprehensive case' do
    it 'returns the expected array of coutners' do
      counters_count = 5
      operations     = [ 3, 4, 4, 6, 1, 4, 4 ]

      expected_output = [ 3, 2, 2, 4, 2 ]

      expect(solution1(counters_count, operations)).to eq(expected_output)
    end
  end
end

describe 'solution2' do
  describe 'first rule' do
    it 'increases the required counters' do
      counters_count = 5
      operations     = [ 3, 4, 4 ]

      expected_output = [ 0, 0, 1, 2, 0 ]

      expect(solution2(counters_count, operations)).to eq(expected_output)
    end
  end

  describe 'second rule' do
    it 'sets all coutners to the max' do
      counters_count = 5
      operations     = [ 4, 4, 4, 6 ]

      expected_output = [ 3, 3, 3, 3, 3 ]

      expect(solution2(counters_count, operations)).to eq(expected_output)
    end
  end

  describe 'comprehensive case' do
    it 'returns the expected array of coutners' do
      counters_count = 5
      operations     = [ 3, 4, 4, 6, 1, 4, 4 ]

      expected_output = [ 3, 2, 2, 4, 2 ]

      expect(solution2(counters_count, operations)).to eq(expected_output)
    end
  end
end
