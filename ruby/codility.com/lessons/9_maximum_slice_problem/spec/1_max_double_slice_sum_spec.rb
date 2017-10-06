require './1_max_double_slice_sum'
require '../../../spec_helper'

examples = [
  {
    context: 'comprehensive case',
    input: [ [ 3, 2, 6, -1, 4, 5, -1, 2 ] ],
    expected_output: 17
  },
  {
    context: 'when we have less items than 4',
    input: [ [ 1, 2, 3 ] ],
    expected_output: 0
  }
]

describe "solution1" do
  test_batch_examples examples, :solution1
end
