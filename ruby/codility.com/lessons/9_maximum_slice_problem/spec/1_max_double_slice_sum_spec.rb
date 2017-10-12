require './1_max_double_slice_sum'
require '../../../spec_helper'

examples = [
  {
    context: 'basic case 1',
    input: [ [ 9, 1, 2, 9 ] ],
    expected_output: 2
  },
  {
    context: 'basic case 2',
    input: [ [ 1, -9, 9, -9, -9 ] ],
    expected_output: 9
  },
  {
    context: 'basic case 3',
    input: [ [ 1, -9, 2, 0, 0, 1, -9, 1 ] ],
    expected_output: 3
  },
  {
    context: 'basic case 4',
    input: [ [ 1, -9, -100, 1, 2, 3, -100, 5 ] ],
    # input: [ [ 1, -9, -100, 1, 2, 3, -100, 5, 0, 100, 0 ] ],
    expected_output: 6
  },
  {
    context: 'basic case 4',
    input: [ [ -2, -3, -4, 1, -5, -6, -7 ] ],
    expected_output: 1
  },
  {
    context: 'comprehensive case',
    input: [ [ 3, 2, 6, -1, 4, 5, -1, 2 ] ],
    expected_output: 17
  },
  {
    context: 'when we have less than 4 items',
    input: [ [ 1, 2, 3 ] ],
    expected_output: 0
  }
]

describe "solution1" do
  test_batch_examples examples, :solution1
end
