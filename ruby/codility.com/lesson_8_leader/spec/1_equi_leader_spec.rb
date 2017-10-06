require './1_equi_leader'
require '../../spec_helper'

examples = [
  {
    context: 'comprehensive case',
    input: [ [ 4, 3, 4, 4, 4, 2 ] ],
    expected_output: 2
  },
  {
    context: 'comprehensive case',
    input: [ [ 1, 1, 2, 2, 3 ] ],
    expected_output: 0
  }
]

describe "solution1" do
  test_batch_examples examples, :solution1
end
