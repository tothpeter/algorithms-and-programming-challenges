require './4_number_of_disc_intersections'
require '../../spec_helper'

examples = [
  {
    context: 'simple examples',
    input: [ [ 2, 0, 0, 2 ] ],
    expected_output: 5
  },
  {
    context: 'when there is no intersect',
    input: [ [ 0, 0, 0, 0 ] ],
    expected_output: 0
  },
  {
    context: 'when 2 whole discs share only their borders with 2 other discs with zero radius',
    input: [ [ 1, 0, 0, 1 ] ],
    expected_output: 2
  },
  {
    context: 'when 2 discs share only their borders',
    input: [ [ 1, 0 ] ],
    expected_output: 1
  },
  {
    context: 'complex example',
    input: [ [ 1, 5, 2, 1, 4, 0 ] ],
    expected_output: 11
  },
  {
    context: 'when there is too many intersect',
    input: [ Array.new(5000, 2000) ],
    expected_output: -1
  }
]

# describe "solution1" do
#   test_batch_examples examples, :solution1
# end

# describe "solution2" do
#   test_batch_examples examples, :solution2
# end

describe "solution3" do
  test_batch_examples examples, :solution3
end
