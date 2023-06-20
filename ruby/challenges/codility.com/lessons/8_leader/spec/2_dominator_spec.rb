require './2_dominator'
require '../../../spec_helper'

examples = [
  {
    context: 'when the input is empty',
    input: [ [ ] ],
    expected_output: -1
  },
  {
    context: 'when there is no dominator',
    input: [ [ 1, 1, 3, 4 ] ],
    expected_output: -1
  }
]



describe "solution1" do
  test_batch_examples examples, :solution1

  it 'returns index of any element of array A in which the dominator of A occurs' do
    result = solution1 [ 3, 4, 3, 2, 3, -1, 3, 3 ]

    expect([0, 2, 4, 6, 7]).to include(result)
  end
end
