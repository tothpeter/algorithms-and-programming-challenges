require './binary_search_tree'

describe BinarySearchTree do
  describe '#find_second_largest' do
    
    context 'when the 2nd largest is the mostright' do
      it 'returns the 2nd largest number from the tree' do
        bst = BinarySearchTree.new 5
        input = [ 3, 8, 1, 4, 7, 9 ]
        input.each do |val|
          bst.add val
        end

        expect(bst.find_second_largest).to eq 8
      end
    end

    context 'when the 2nd largest is in the the mostright children' do
      it 'returns the 2nd largest number from the tree' do
        bst = BinarySearchTree.new 5
        input = [ 3, 8, 1, 4, 7, 12, 10, 9, 11 ]
        input.each do |val|
          bst.add val
        end

        expect(bst.find_second_largest).to eq 11
      end
    end

    context 'when the 2nd largest is the the mostright first child' do
      it 'returns the 2nd largest number from the tree' do
        bst = BinarySearchTree.new 5
        input = [ 3, 8, 1, 4, 7, 12, 10, 9 ]
        input.each do |val|
          bst.add val
        end

        expect(bst.find_second_largest).to eq 10
      end
    end

  end
end