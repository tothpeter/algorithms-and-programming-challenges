require './challenge2_passing_cars'

describe 'solution' do
  it '' do
    input = [ 0, 1, 0, 1, 1 ]
    expected_output = 5

    output = solution input

    expect(output).to eq(expected_output)
  end
end

describe 'solution_return_the_pairs' do
  it '' do
    input = [ 0, 1, 0, 1, 1 ]
    expected_output = [ [0, 1], [0, 3], [0, 4], [2, 3], [2, 4] ]

    output = solution_return_the_pairs input

    expect(output).to eq(expected_output)
  end
end
