require './challenge3_missing_integer'

examples = [
  {
    context: 'when we have duplicated numbers',
    input: [ 1, 3, 6, 4, 1, 2 ],
    expected_output: 5
  },
  {
    context: 'when we have an ordered uniq squance',
    input: [ 1, 2, 3 ],
    expected_output: 4
  },
  {
    context: 'when we have only negative numebrs',
    input: [ -1, -5 ],
    expected_output: 1
  }
]

describe "solution1" do
  examples.each do |example|
    it "returns the smallest positive integer" do
      expect(solution1(example[:input])).to eq(example[:expected_output])
    end
  end
end


describe "solution2" do
  examples.each do |example|
    it "returns the smallest positive integer" do
      expect(solution2(example[:input])).to eq(example[:expected_output])
    end
  end
end
