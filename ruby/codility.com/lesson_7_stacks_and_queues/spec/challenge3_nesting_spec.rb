require './challenge3_nesting'
require '../../spec_helper'

examples = [
  {
    context: 'empty',
    input: [ '' ],
    expected_output: 1
  },
  {
    context: 'missing closing',
    input: [ '(()' ],
    expected_output: 0
  },
  {
    context: 'missing opening',
    input: [ '())' ],
    expected_output: 0
  },
  {
    context: 'wrong order1',
    input: [ '())(' ],
    expected_output: 0
  },
  {
    context: 'wrong order2',
    input: [ ')())' ],
    expected_output: 0
  },
  {
    context: 'simple exapmle',
    input: [ '()' ],
    expected_output: 1
  },
  {
    context: 'simple nesting',
    input: [ '(())' ],
    expected_output: 1
  },
  {
    context: 'complicated nesting',
    input: [ '(()(())())' ],
    expected_output: 1
  }
]

describe "solution1" do
  test_batch_examples examples, :solution1
end

describe "solution2" do
  test_batch_examples examples, :solution2
end
