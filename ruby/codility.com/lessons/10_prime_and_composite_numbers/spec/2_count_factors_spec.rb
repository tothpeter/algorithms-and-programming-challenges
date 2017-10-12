require './2_count_factors'
require '../../../spec_helper'

examples = [
  {
    context: 'basic case 1',
    input: [ 1 ],
    expected_output: 1
  },
  {
    context: 'basic case 1',
    input: [ 2 ],
    expected_output: 2
  },
  {
    context: 'basic case 2',
    input: [ 10 ],
    expected_output: 4
  },
  {
    context: 'basic case 3',
    input: [ 24 ],
    expected_output: 8
  },
  {
    context: 'basic case 4, when the square root is an integer',
    input: [ 64 ],
    expected_output: 7
  },
]

describe "solution1" do
  test_batch_examples examples, :solution1
end
