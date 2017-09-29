require './challenge1_perm_check'

examples = [
  {
    context: 'when the input is empty',
    input: [ ],
    expected_output: 0
  },
  {
    context: 'when the input contains a duplicated element',
    input: [ 2, 1, 3, 4, 2 ],
    expected_output: 0
  },
  {
    context: 'when the sum of the elements is what expected',
    input: [ 1, 2, 2, 5 ],
    expected_output: 0
  },
  {
    context: 'when the input is missing an element',
    input: [ 2, 1, 4 ],
    expected_output: 0
  },
  {
    context: 'when the input is a permutation',
    input: [ 4, 2, 3, 1 ],
    expected_output: 1
  }
]

describe "solution1" do
  examples.each do |example|
    context example[:context] do
      it "returns #{example[:expected_output]} for #{example[:input]}" do
        expect(solution1(example[:input])).to eq(example[:expected_output])
      end
    end
  end
end

describe "solution2" do
  examples.each do |example|
    context example[:context] do
      it "returns #{example[:expected_output]} for #{example[:input]}" do
        expect(solution2(example[:input])).to eq(example[:expected_output])
      end
    end
  end
end

describe "solution3" do
  examples.each do |example|
    context example[:context] do
      it "returns #{example[:expected_output]} for #{example[:input]}" do
        expect(solution3(example[:input])).to eq(example[:expected_output])
      end
    end
  end
end
