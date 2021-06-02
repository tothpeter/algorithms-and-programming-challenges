# frozen_string_literal: true

require './2_cyclic_rotation'
require '../../../spec_helper'

examples = [
  {
    context: 'when the number of rotates is the same number as the lenght of the list',
    input: [ [ 1, 2, 3 ], 6 ],
    expected_output: [ 1, 2, 3 ]
  },
  {
    context: 'when the number of rotates is bigger than the length of the list',
    input: [ [ 1, 2, 3 ], 4 ],
    expected_output: [ 3, 1, 2 ]
  },
  {
    context: 'when the number of rotates is smaller than the length of the list',
    input: [ [ 1, 2, 3 ], 1 ],
    expected_output: [ 3, 1, 2 ]
  },
  {
    context: 'when the number of rotates is smaller than the length of the list',
    input: [ [ 1, 1, 2, 3, 5 ], 4 ],
    expected_output: [1, 2, 3, 5, 1]
  },
  {
    context: 'when input is empty array',
    input: [ [ ], 2 ],
    expected_output: [ ]
  },
  {
    context: 'when input is empty array',
    input: [ [ ], 0 ],
    expected_output: [ ]
  }
]

describe 'solution_copy_one_by_one' do
  test_batch_examples examples, :solution_copy_one_by_one
end

describe 'solution_built_in' do
  test_batch_examples examples, :solution_built_in
end
