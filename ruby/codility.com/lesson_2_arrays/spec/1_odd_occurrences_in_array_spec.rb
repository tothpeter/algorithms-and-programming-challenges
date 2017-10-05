require './1_odd_occurrences_in_array'

describe 'solution1' do
  it 'returns the odd times occuring item' do
    input = [ 1, 2 ,1 ]

    expect(solution1(input)).to eq(2)

    input = [ 1 ]

    expect(solution1(input)).to eq(1)

    input = [ 0 ]

    expect(solution1(input)).to eq(0)
  end
end
