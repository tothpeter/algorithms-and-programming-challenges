require './2_frog_jmp'

describe 'solution' do
  it 'returns the minimum number of jumps' do
    expected_output = 3
    output = solution 10, 85, 30

    expect(output).to eq(expected_output)
  end
end
