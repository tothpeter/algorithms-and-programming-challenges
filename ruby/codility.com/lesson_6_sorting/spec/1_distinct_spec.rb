require './1_distinct'

describe 'solution1' do
  it 'it returns number of distinct values in order' do
    input = [ 2, 1, 2, 3, 1 ]
    expected_output = 3

    output = solution1 input

    expect(output).to eq(expected_output)
  end

  it 'it returns 0 when the input is empty' do
    input = [ ]
    expected_output = 0

    output = solution1 input

    expect(output).to eq(expected_output)
  end
end

describe 'solution2' do
  it 'it returns number of distinct values in order' do
    input = [ 2, 1, 2, 3, 1 ]
    expected_output = 3

    output = solution2 input

    expect(output).to eq(expected_output)
  end

  it 'it returns 0 when the input is empty' do
    input = [ ]
    expected_output = 0

    output = solution2 input

    expect(output).to eq(expected_output)
  end
end
