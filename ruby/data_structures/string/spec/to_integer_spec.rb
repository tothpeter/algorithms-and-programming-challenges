require_relative '../to_integer'

describe String do
  describe '#to_integer' do
    context 'when it is not a number' do
      it 'returns nil' do
        expect('- 123'.to_integer).to eq(nil)
        expect('-123a'.to_integer).to eq(nil)
      end
    end

    context 'when the number is not negative' do
      it 'converts a string to an integer' do
        string_number = '123456'

        expect(string_number.to_integer).to eq(123456)
      end
    end

    context 'when the number is negative' do
      it 'converts a string to an integer' do
        string_number = '-123456'

        expect(string_number.to_integer).to eq(-123456)
      end
    end
  end
end
