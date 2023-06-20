require './1_min_perimeter_rectangle'
require '../../../spec_helper'

examples = [
  {
    context: 'basic case 1',
    input: [ 1 ],
    expected_output: 4
  },
  {
    context: 'basic case 2',
    input: [ 30 ],
    expected_output: 22
  },
  {
    context: 'basic case 3',
    input: [ 101 ],
    expected_output: 204
  }
]

describe "solution1" do
  test_batch_examples examples, :solution1
end
