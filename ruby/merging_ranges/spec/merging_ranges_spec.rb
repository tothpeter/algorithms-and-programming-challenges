require './merging_ranges'

describe 'exercise' do
  context 'we have not overlaping but neighbourly meetings' do
    it 'does something' do
      input = [ [1, 2], [2, 3] ]
      expect(exercise(input)).to eq [ [1, 3] ]
    end
  end

  context 'we have half overlaping meetings' do
    it 'does something' do
      input = [ [1, 3], [1, 4] ]
      expect(exercise(input)).to eq [ [1, 4] ]

      input = [ [1, 3], [0, 3] ]
      expect(exercise(input)).to eq [ [0, 3] ]
    end
  end

  context 'we have fully overlaping meetings' do
    it 'does something' do
      input = [ [1, 4], [2, 3] ]
      expect(exercise(input)).to eq [ [1, 4] ]

      input = [ [2, 3], [1, 4] ]
      expect(exercise(input)).to eq [ [1, 4] ]
    end
  end

  context 'when the first merge creates a new merge options inside' do
    it 'does something' do
      input = [ [0, 3], [6, 9], [1, 6] ]
      expect(exercise(input)).to eq [ [0, 9] ]

      input = [ [2, 3], [1, 4] ]
      expect(exercise(input)).to eq [ [1, 4] ]
    end
  end

  context 'we have events not in order' do
    it 'does something' do
      input = [ [0, 1], [3, 5], [4, 8], [10, 12], [9, 10] ]
      expect(exercise(input)).to eq [ [0, 1], [3, 8], [9, 12] ]
    end
  end
end