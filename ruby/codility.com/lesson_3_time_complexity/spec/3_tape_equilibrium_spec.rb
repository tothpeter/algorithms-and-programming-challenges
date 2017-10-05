require './3_tape_equilibrium'

describe 'solution' do
  it 'returns the min difference' do
    # P = 1, difference = |3 − 10| = 7
    # P = 2, difference = |4 − 9| = 5
    # P = 3, difference = |6 − 7| = 1
    # P = 4, difference = |10 − 3| = 7

    expected_output = 1
    output = solution [ 3, 1, 2, 4, 3 ]

    expect(output).to eq(expected_output)
  end
end
