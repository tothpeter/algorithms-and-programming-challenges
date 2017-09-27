require './solution'

examples = [
  {
    input: 9,
    expected_output: 2,
    hint: "1001"
  },
  {
    input: 529,
    expected_output: 4,
    hint: "1000010001"
  },
  {
    input: 20,
    expected_output: 1,
    hint: "10100"
  },
  {
    input: 15,
    expected_output: 0,
    hint: "1111"
  },
  {
    input: 1041,
    expected_output: 5,
    hint: "10000010001"
  },
]

describe "solution1" do
  examples.each do |example|
    it "returns #{example[:expected_output]} for #{example[:input].to_s(2)}" do
      expect(solution1(example[:input])).to eq(example[:expected_output])
    end
  end
end

describe "solution2" do
  examples.each do |example|
    it "returns #{example[:expected_output]} for #{example[:input].to_s(2)}" do
      expect(solution2(example[:input])).to eq(example[:expected_output])
    end
  end
end
