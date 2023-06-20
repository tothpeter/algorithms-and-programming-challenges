require './2_brackets'
require '../../../spec_helper'

examples = [
  {
    context: 'empty',
    input: [ '' ],
    expected_output: 1
  },
  {
    context: 'simple prehtesis',
    input: [ '()' ],
    expected_output: 1
  },
  {
    context: '',
    input: [ '([)' ],
    expected_output: 0
  },
  {
    context: 'simple nesting',
    input: [ '([])' ],
    expected_output: 1
  },
  {
    context: 'simple nesting',
    input: [ '([{}])([{}])' ],
    expected_output: 1
  },
  {
    context: 'simple nesting',
    input: [ '([)()]' ],
    expected_output: 0
  }
]

describe "solution1" do
  test_batch_examples examples, :solution1
end
