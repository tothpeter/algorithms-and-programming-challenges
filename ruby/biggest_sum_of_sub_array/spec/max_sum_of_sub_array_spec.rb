require './max_sum_of_sub_array'

describe 'exercise' do
  context 'when we have only negative numbers' do
    it 'returns the correct hash' do
      input = [-100, -1, -3, -4, -5, -3]
      
      expected_output = {
        first_index: 1,
        last_index: 1,
        sum: -1
      }

      expect(exercise(input)).to eq expected_output
    end
  end

  context 'when -5 and 6 generates a bigger sum at the end of the day' do
    it 'returns the correct hash' do
      input = [-1, -2, 3, 4, -5, 6]
      
      expected_output = {
        first_index: 2,
        last_index: 5,
        sum: 8
      }

      expect(exercise(input)).to eq expected_output
    end
  end

  
  it 'returns the correct hash' do
    input = [-1, -2, 3, -4, 0, 100]
    
    expected_output = {
      first_index: 4,
      last_index: 5,
      sum: 100
    }

    expect(exercise(input)).to eq expected_output
  end

  it 'returns the correct hash' do
    input = [2, -1, 2, -1, 4, -5]
    
    expected_output = {
      first_index: 0,
      last_index: 4,
      sum: 6
    }

    expect(exercise(input)).to eq expected_output
  end
end