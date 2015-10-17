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

    context 'when we have only one node' do
      it 'returns the 2nd largest number from the tree' do
        bst = BinarySearchTree.new 5
        
        expect(bst.find_second_largest).to eq 5
      end
    end

    context 'when we have only 2 nodes' do
      it 'returns the 2nd largest number from the tree' do
        bst = BinarySearchTree.new 5
        bst.add 6
        
        expect(bst.find_second_largest).to eq 5
      end
    end

  end


  describe '#find_second_largest_enhanced' do
    
    context 'when the 2nd largest is the mostright' do
      it 'returns the 2nd largest number from the tree' do
        bst = BinarySearchTree.new 5
        input = [ 3, 8, 1, 4, 7, 9 ]
        input.each do |val|
          bst.add val
        end

        expect(bst.find_second_largest_enhanced).to eq 8
      end
    end

    context 'when the 2nd largest is in the the mostright children' do
      it 'returns the 2nd largest number from the tree' do
        bst = BinarySearchTree.new 5
        input = [ 3, 8, 1, 4, 7, 12, 10, 9, 11 ]
        input.each do |val|
          bst.add val
        end

        expect(bst.find_second_largest_enhanced).to eq 11
      end
    end

    context 'when the 2nd largest is the the mostright first child' do
      it 'returns the 2nd largest number from the tree' do
        bst = BinarySearchTree.new 5
        input = [ 3, 8, 1, 4, 7, 12, 10, 9 ]
        input.each do |val|
          bst.add val
        end

        expect(bst.find_second_largest_enhanced).to eq 10
      end
    end

    context 'when we have only one node' do
      it 'returns the 2nd largest number from the tree' do
        bst = BinarySearchTree.new 5
        
        expect(bst.find_second_largest_enhanced).to eq 5
      end
    end

    context 'when we have only 2 nodes' do
      it 'returns the 2nd largest number from the tree' do
        bst = BinarySearchTree.new 5
        bst.add 6
        
        expect(bst.find_second_largest_enhanced).to eq 5
      end
    end

  end

  describe '#height_recursive' do
    describe 'when it has 1 node' do
      it 'returns the correct height' do
        bst = BinarySearchTree.new 5
        
        expect(bst.height_recursive).to eq 0
      end
    end

    describe 'when it has many nodes' do
      it 'returns the correct height' do
        bst = BinarySearchTree.new 5
        bst.add 10
        bst.add 4
        bst.add 7
        bst.add 11
        bst.add 8
        
        expect(bst.height_recursive).to eq 3
      end
    end
  end
    end
  end
end