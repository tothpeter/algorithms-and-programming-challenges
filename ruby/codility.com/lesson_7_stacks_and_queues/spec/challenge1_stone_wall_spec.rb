require './challenge1_stone_wall'
require '../../spec_helper'

examples = [
  {
    context: 'simple examples',
    input: [ [ 8, 8, 5, 7, 9, 8, 7, 4, 8 ] ],
    expected_output: 7
  },
  {
    context: 'merge 2 walls using one stone',
    input: [ [ 8, 8 ] ],
    expected_output: 1
  },
  {
    context: 'when the heights are in descending order',
    input: [ [ 8, 8, 6, 6 ] ],
    expected_output: 2
  },
  {
    context: '2 stones',
    input: [ [ 1, 2, 1 ] ],
    expected_output: 2
  }
]

# describe "solution1" do
#   test_batch_examples examples, :solution1
# end

describe "solution2" do
  test_batch_examples examples, :solution2
end
