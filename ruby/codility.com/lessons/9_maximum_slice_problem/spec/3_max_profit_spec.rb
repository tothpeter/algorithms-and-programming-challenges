require './3_max_profit'
require '../../../spec_helper'

examples = [
  {
    context: 'when the input is empty',
    input: [ [  ] ],
    expected_output: 0
  },
  {
    context: 'when the stock becomes less and less every day',
    input: [ [ 3, 2, 1 ] ],
    expected_output: 0
  },
  {
    context: 'simple example 1',
    input: [ [ 3, 2, 5, 5, 10 ] ],
    expected_output: 8
  },
  {
    context: 'simple example 2',
    input: [ [ 3, 2, 5, -1, 10 ] ],
    expected_output: 11
  },
  {
    context: 'simple example 3',
    input: [ [ 3, -1, 5, 5, 10 ] ],
    expected_output: 11
  },
  {
    context: 'original example',
    input: [ [ 3171, 1011, 1123, 1366, 1013, 1367 ] ],
    expected_output: 356
  }
]

describe "solution1" do
  test_batch_examples examples, :solution1
end
