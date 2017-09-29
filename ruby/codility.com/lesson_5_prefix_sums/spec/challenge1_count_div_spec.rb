require './challenge1_count_div'
require '../../spec_helper'

examples = [
  {
    context: 'when the diviser is smaller then the first number',
    input: [ 31, 39, 3 ],
    expected_output: 3
  },
  {
    context: 'when the diviser is greater then the first number',
    input: [ 10, 100, 50 ],
    expected_output: 2
  },
  {
    context: 'when the first and the last number are divisible',
    input: [ 10, 16, 2 ],
    expected_output: 4
  },
  {
    context: 'when only the first number is divisible',
    input: [ 10, 16, 10 ],
    expected_output: 1
  },
  {
    context: 'when only the last number is divisible',
    input: [ 10, 16, 16 ],
    expected_output: 1
  },
  {
    context: 'when no number is divisible',
    input: [ 10, 16, 20 ],
    expected_output: 0
  }
]

describe "solution" do
  test_batch_examples examples
end

describe "solution2" do
  test_batch_examples examples, :solution2
end
