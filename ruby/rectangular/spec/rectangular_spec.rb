require './rectangular'

describe 'exercise' do
  let(:rectangular1) {{
    x: 1,
    y: 5,

    width: 10,
    height: 4
  }}

  context 'when they have no intersection' do
    it 'returns nil' do
      rectangular2 = {
        x: 20,
        y: 100,

        width: 10,
        height: 4
      }

      expect(exercise(rectangular1, rectangular2)).to eq nil
    end
  end

  context 'when they have partial intersection' do
    it 'returns the right rectangular as a hash' do
      rectangular2 = {
        x: 2,
        y: 6,

        width: 10,
        height: 4
      }

      expected_rectangular = {
        x: 2,
        y: 6,

        width: 9,
        height: 3
      }

      expect(exercise(rectangular1, rectangular2)).to eq expected_rectangular
    end
  end

  context 'when they have full intersection' do
    it 'returns the right rectangular as a hash' do
      rectangular2 = {
        x: 1,
        y: 5,

        width: 10,
        height: 4
      }

      expected_rectangular = {
        x: 1,
        y: 5,

        width: 10,
        height: 4
      }

      expect(exercise(rectangular1, rectangular2)).to eq expected_rectangular
    end
  end

  context 'when they have only one side intersection' do
    
  end

end