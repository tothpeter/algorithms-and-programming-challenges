require './find_unique_integer'

describe 'find_unique_integer' do
  it 'returns the unique integer' do
    input = [1,1,3,2,3]
    expect(find_unique_integer(input)).to eq 2

    input = [2,2,3,1,3]
    expect(find_unique_integer(input)).to eq 1
  end
end