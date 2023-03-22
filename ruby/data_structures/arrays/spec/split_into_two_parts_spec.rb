require './split_into_two_parts'

require '../../spec_helper'

examples = [
  {
    context: 'simple case 1, when tehere is only 2 numbers',
    input: [ [ 1, 1 ] ],
    expected_output: 1
  },
  {
    context: 'simple case 2, when the first item is not the biggest',
    input: [ [ 2, 5, -2, 8, 7 ] ],
    expected_output: 3
  },
  {
    context: 'simple case 3, when the numbers are rising',
    input: [ [ 1, 1, 3, 4 ] ],
    expected_output: 2
  },
  {
    context: 'simple case 4',
    input: [ [ -1, -2, 3, 4 ] ],
    expected_output: 2
  },
  {
    context: 'simple case 5',
    input: [ [ -1, -2, 10, -1, 11, -1, 14, 12 ] ],
    expected_output: 6
  },
  {
    context: 'simple case 6',
    input: [ [ -1, 10, 1, 2, 3 ] ],
    expected_output: 1
  },
  {
    context: 'simple case 7',
    input: [ [ -1, -2, -3, -4 ] ],
    expected_output: 3
  },
  {
    context: 'simple case 8',
    input: [ [ -1, -2, 5, -2, -4 ] ],
    expected_output: 4
  },
  {
    context: 'simple case 9',
    input: [ [ 2, 1, 2, 10 ] ],
    expected_output: 3
  },
  {
    context: 'simple case 10',
    input: [ [ 1, 2, 3, 4, 5 ] ],
    expected_output: 1
  },
  {
    context: 'simple case 11',
    input: [ [ 5, 2, 3, 1, 5, 6, 7 ] ],
    expected_output: 5
  },
  {
    context: 'simple case 12',
    input: [ [ 1, 2, 3, 3, 3, 4 ] ],
    expected_output: 1
  },
  {
    context: 'simple case 13, stagnate1',
    input: [ [ 1, 1, 1, 2, 3 ] ],
    expected_output: 3
  },
  {
    context: 'simple case 14, stagnate2',
    input: [ [ 1, 3, -1, 10, 11, 11 ] ],
    expected_output: 3
  },
  {
    context: 'simple case 15',
    input: [ [ 1, -1, 10, 5, 15, 11, 16 ] ],
    expected_output: 2
  },
  {
    context: 'simple case 16, when there is a 2nd peak after the first one',
    input: [ [ 1, -1, 5, -1, 4, 5, 6, 7 ] ],
    expected_output: 6
  },
  {
    context: 'default from task',
    input: [ [ 5, -2, 3, 8, 6 ] ],
    expected_output: 3
  },
  {
    context: 'default from task 2',
    input: [ [ -5, -5, -5, -42, 6, 12 ] ],
    expected_output: 4
  },
]

describe "solution" do
  test_batch_examples examples, :solution
end
