require './k_closest_points_to_the_origin'

require '../../spec_helper'

examples = [
  {
    context: 'simple case 1',
    input: [
      [
        [ -2,  4 ],
        [  0, -2 ],
        [ -1,  0 ],
        [  2, -5 ],
        [ -2, -3 ],
        [  3,  2 ],
      ],

      2
    ],
    expected_output: [
      [ -1,  0 ],
      [  0, -2 ]
    ]
  },
  # {
  #   context: '',
  #   input: [ [  ] ],
  #   expected_output:
  # },
  # {
  #   context: '',
  #   input: [ [  ] ],
  #   expected_output:
  # },
]

describe "solution1" do
  test_batch_examples examples, :solution1
end
