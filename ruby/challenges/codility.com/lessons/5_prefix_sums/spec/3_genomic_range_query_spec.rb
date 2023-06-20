require './3_genomic_range_query'

describe 'solution' do
  let(:dna_string)      { 'CAGCCTA' }
  let(:bottom_limits)   { [ 2, 5, 0 ] }
  let(:top_limits)      { [ 4, 5, 6 ] }

  let(:expected_output) { [ 2, 4, 1 ] }

  # describe 'solution1' do
  #   it 'returns the consecutive answers to all queries' do
  #     output = solution1 dna_string, bottom_limits, top_limits
  #
  #     expect(output).to eq(expected_output)
  #   end
  # end

  # describe 'solution2' do
  #   it 'returns the consecutive answers to all queries' do
  #     output = solution2 dna_string, bottom_limits, top_limits
  #
  #     expect(output).to eq(expected_output)
  #   end
  # end

  describe 'solution3' do
    it 'returns the consecutive answers to all queries' do
      output = solution3 dna_string, bottom_limits, top_limits

      expect(output).to eq(expected_output)
    end
  end
end
