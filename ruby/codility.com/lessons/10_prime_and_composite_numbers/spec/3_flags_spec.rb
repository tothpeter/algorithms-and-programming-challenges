require './3_flags'
require '../../../spec_helper'

examples = [
  {
    context: 'basic case 1',
    input: [ [ 1, 5, 3, 4, 3 ] ],
    expected_output: 3
  },
  {
    context: 'default example',
    input: [ [ 1, 5, 3, 4, 3, 4, 1, 2, 3, 4, 6, 2 ] ],
    expected_output: 3
  },
]

describe "solution1" do
  test_batch_examples examples, :solution1
end
