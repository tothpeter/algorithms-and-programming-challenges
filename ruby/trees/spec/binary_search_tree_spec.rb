require './binary_search_tree'

describe BinarySearchTree do
  describe '#find_second_largest' do

    context 'when the 2nd largest is the mostright' do
      it 'returns the 2nd largest number from the tree' do
        bst = BinarySearchTree.new
        bst.add [ 5, 3, 8, 1, 4, 7, 9 ]

        expect(bst.find_second_largest).to eq 8
      end
    end

    context 'when the 2nd largest is in the the mostright children' do
      it 'returns the 2nd largest number from the tree' do
        bst = BinarySearchTree.new
        bst.add  [ 5, 3, 8, 1, 4, 7, 12, 10, 9, 11 ]

        expect(bst.find_second_largest).to eq 11
      end
    end

    context 'when the 2nd largest is the the mostright first child' do
      it 'returns the 2nd largest number from the tree' do
        bst = BinarySearchTree.new
        bst.add [ 5, 3, 8, 1, 4, 7, 12, 10, 9 ]

        expect(bst.find_second_largest).to eq 10
      end
    end

    # context 'when we have only one node' do
    #   it 'returns the 2nd largest number from the tree' do
    #     bst = BinarySearchTree.new 5

    #     expect(bst.find_second_largest).to eq 5
    #   end
    # end

    context 'when we have only 2 nodes' do
      it 'returns the 2nd largest number from the tree' do
        bst = BinarySearchTree.new
        bst.add [ 5, 6 ]

        expect(bst.find_second_largest).to eq 5
      end
    end

  end


  describe '#find_second_largest_enhanced' do

    context 'when the 2nd largest is the mostright' do
      it 'returns the 2nd largest number from the tree' do
        bst = BinarySearchTree.new
        bst.add [ 5, 3, 8, 1, 4, 7, 9 ]

        expect(bst.find_second_largest_enhanced).to eq 8
      end
    end

    context 'when the 2nd largest is in the the mostright children' do
      it 'returns the 2nd largest number from the tree' do
        bst = BinarySearchTree.new
        bst.add [ 5, 3, 8, 1, 4, 7, 12, 10, 9, 11 ]

        expect(bst.find_second_largest_enhanced).to eq 11
      end
    end

    context 'when the 2nd largest is the the mostright first child' do
      it 'returns the 2nd largest number from the tree' do
        bst = BinarySearchTree.new
        bst.add [ 5, 3, 8, 1, 4, 7, 12, 10, 9 ]

        expect(bst.find_second_largest_enhanced).to eq 10
      end
    end

    context 'when we have only one node' do
      it 'returns the 2nd largest number from the tree' do
        bst = BinarySearchTree.new
        bst.add 5

        expect(bst.find_second_largest_enhanced).to eq 5
      end
    end

    context 'when we have only 2 nodes' do
      it 'returns the 2nd largest number from the tree' do
        bst = BinarySearchTree.new
        bst.add [ 5, 6 ]

        expect(bst.find_second_largest_enhanced).to eq 5
      end
    end

  end

  describe '#height_recursive' do
    describe 'when it has 1 node' do
      it 'returns the correct height' do
        bst = BinarySearchTree.new
        bst.add 5

        expect(bst.height_recursive).to eq 0
      end
    end

    describe 'when it has many nodes' do
      it 'returns the correct height' do
        bst = BinarySearchTree.new
        bst.add [ 5, 10, 4, 7, 11, 8 ]

        expect(bst.height_recursive).to eq 3
      end
    end
  end

  describe '#height_iterative' do
    describe 'when it has 1 node' do
      it 'returns the correct height' do
        bst = BinarySearchTree.new
        bst.add 5

        expect(bst.height_iterative).to eq 0
      end
    end

    describe 'when it has many nodes' do
      it 'returns the correct height' do
        bst = BinarySearchTree.new
        bst.add [ 5, 10, 4, 7, 11, 8 ]

        expect(bst.height_iterative).to eq 3
      end
    end
  end

  # The width of a tree is the number of nodes on the longest path between two terminal nodes (leaves) in the tree
  describe '#width_recursive' do
    describe 'when it has 1 node' do
      it 'returns the correct width' do
        bst = BinarySearchTree.new
        bst.add 5

        expect(bst.width_recursive).to eq 0
      end
    end

    describe 'when it has many nodes' do
      it 'returns the correct width' do
        bst = BinarySearchTree.new
        bst.add [ 5, 10, 4, 7, 11, 8 ]

        expect(bst.width_recursive).to eq 4
      end
    end
  end


  # A tree is "superbalanced" if the difference between the depths of any two leaf nodes is no greater than one.
  describe '#superbalanced?' do
    describe 'when it only has right children' do
      it 'returns false' do
        bst = BinarySearchTree.new
        bst.add [ 5, 6, 7]

        expect(bst.superbalanced?).to eq false
      end
    end

    describe 'when it only has left children' do
      it 'returns false' do
        bst = BinarySearchTree.new
        bst.add [ 5, 4, 3]

        expect(bst.superbalanced?).to eq false
      end
    end

    describe 'when it is not super balanced' do
      it 'returns false' do
        bst = BinarySearchTree.new
        bst.add [ 5, 3, 4, 2, 1, 7 ]

        expect(bst.superbalanced?).to eq false
      end
    end

    describe 'when it is super balanced' do
      it 'returns true' do
        bst = BinarySearchTree.new
        bst.add [ 5, 3, 4, 2, 7, 6, 8 ]

        expect(bst.superbalanced?).to eq true
      end
    end

    describe 'when it is super balanced with only 2 branches' do
      it 'returns true' do
        bst = BinarySearchTree.new
        bst.add [ 5, 3, 2, 1, 6, 7 ]

        expect(bst.superbalanced?).to eq true
      end
    end
  end

  describe '#traversal_preorder' do
    it 'returns the node values in preorder' do
      bst = BinarySearchTree.new
      bst.add [ 7, 9, 1, 10, 8, 1, 3, 0, 5, 4, 6, 2 ]

      expect(bst.traversal_preorder).to eq [7, 1, 0, 3, 2, 5, 4, 6, 9, 8, 10]
    end
  end

  describe '.build_from_preorder' do
    it 'returns the right BST' do
      bst = BinarySearchTree.build_from_preorder [12, 9, 5, 4, 7, 10, 15, 13, 19, 16]
      expect(bst.traversal_preorder).to eq [12, 9, 5, 4, 7, 10, 15, 13, 19, 16]

      bst = BinarySearchTree.build_from_preorder [7, 1, 0, 3, 2, 5, 4, 6, 9, 8, 10]
      expect(bst.traversal_preorder).to eq [7, 1, 0, 3, 2, 5, 4, 6, 9, 8, 10]
    end
  end
end
