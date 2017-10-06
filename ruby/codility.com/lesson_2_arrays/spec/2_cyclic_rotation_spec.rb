require './2_cyclic_rotation'

describe 'solution1' do
  context "when the number of rotates is the same number as the lenght of the list" do
    it 'does not rotate the list' do
      list          = [ 1, 2, 3 ]
      expected_list = [ 1, 2, 3 ]

      solution1 list, 6

      expect(list).to eq(expected_list)
    end
  end

  context "when the number of rotates is bigger than the length of the list" do
    it 'rotates the list by 1' do
      list          = [ 1, 2, 3 ]
      expected_list = [ 3, 1, 2 ]

      solution1 list, 4

      expect(list).to eq(expected_list)
    end
  end

  context "when the number of rotates is smaller than the length of the list" do
    it 'rotates the list' do
      list          = [ 1, 2, 3 ]
      expected_list = [ 3, 1, 2 ]

      solution1 list, 1

      expect(list).to eq(expected_list)

      list          = [ 1, 2, 3 ]
      expected_list = [ 2, 3, 1 ]

      solution1 list, 2

      expect(list).to eq(expected_list)
    end
  end
end
