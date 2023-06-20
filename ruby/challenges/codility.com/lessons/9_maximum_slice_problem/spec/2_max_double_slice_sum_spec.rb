require './2_max_double_slice_sum'
require '../../../spec_helper'

examples = [
  {
    context: 'basic case 1, whole array',
    input: [ [ 3, 2, 0 ] ],
    expected_output: 5
  },
  {
    context: 'basic case 2, only negative numbers',
    input: [ [ -10, -2, -3 ] ],
    expected_output: -2
  },
  {
    context: 'original example',
    input: [ [ 3, 2, -6, 4, 0 ] ],
    expected_output: 5
  },
]

describe "solution1" do
  test_batch_examples examples, :solution1
end
