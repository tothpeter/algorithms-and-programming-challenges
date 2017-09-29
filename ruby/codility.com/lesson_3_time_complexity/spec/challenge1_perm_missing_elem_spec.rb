require './challenge1_perm_missing_elem'

describe 'solution' do
  context "when the list is empty" do
    it 'returns 1' do
      input           = []
      expected_output = 1

      output = solution input

      expect(output).to eq(expected_output)
    end
  end

  context "when the list is not empty" do
    it 'returns the missing item' do
      input           = [ 1, 2, 3, 5 ]
      expected_output = 4

      output = solution input

      expect(output).to eq(expected_output)
    end
  end
end
