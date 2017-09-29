require './challenge2_frog_river_one'

describe 'solution' do
  context "when the frog can not cross the river" do
    it 'returns -1' do
      leaves          = [ 1 ]
      end_position    = 5
      expected_output = -1

      output = solution end_position, leaves

      expect(output).to eq(expected_output)
    end
  end

  context "when the frog can cross the river" do
    it 'returns the earliest the frog can cross' do
      leaves          = [ 1, 3, 1, 4, 2, 3, 5, 4 ]
      end_position    = 5
      expected_output = 6

      output = solution end_position, leaves

      expect(output).to eq(expected_output)
    end
  end
end
