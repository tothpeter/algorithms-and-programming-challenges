require './01'

require '../../spec_helper'

examples = [
  {
    context: '',
    input: [  ],
    expected_output: nil
  },
]

describe 'solution' do
  test_batch_examples examples, :solution
end
