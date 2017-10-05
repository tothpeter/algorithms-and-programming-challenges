require './challenge4_fish'
require '../../spec_helper'

examples = [
  {
    context: 'we have only one fish',
    input: [ [ 1 ], [ 0 ] ],
    expected_output: 1
  },
  {
    context: 'no fish meet',
    input: [ [ 1, 2, 3, 4, 5, 6 ], [ 0, 0, 0, 1, 1, 1 ] ],
    expected_output: 6
  },
  {
    context: 'One fish to rule them all, One Fish to find them',
    input: [ [ 1, 2, 3, 4, 5, 6 ], [ 1, 1, 1, 1, 1, 0 ] ],
    expected_output: 1
  },
  {
    context: 'One fish to rule them all, One Fish to find them reversed',
    input: [ [ 6, 5, 4, 3, 2, 1 ], [ 1, 0, 0, 0, 0, 0 ] ],
    expected_output: 1
  },
  {
    context: 'comprehensive example',
    input: [ [ 4, 3, 2, 1, 5 ], [ 0, 1, 0, 0, 0 ] ],
    expected_output: 2
  }
]

describe "solution1" do
  test_batch_examples examples, :solution1
end
