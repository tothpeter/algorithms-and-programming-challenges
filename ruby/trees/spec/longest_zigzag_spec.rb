require './longest_zigzag'

describe "solution" do
  describe 'simple case 1' do
    it 'returns the max count of zig zag' do
      bst = BinarySearchTree.new
      bst.add [ 5, 3, 4 ]

      expect(solution(bst.root)).to eq 1
    end
  end

  context 'when ' do
    it 'returns the max count of zig zag' do
      bst = BinarySearchTree.new
      bst.add [ 1, 2, 3, 4 ]

      expect(solution(bst.root)).to eq 0
    end
  end

  context 'when ' do
    it 'returns the max count of zig zag' do
      bst = BinarySearchTree.new
      bst.add [ 5, 3, 8, 1, 4, 7, 12, 9, 11, 10 ]

      expect(solution(bst.root)).to eq 3
    end
  end

  context 'when ' do
    it 'returns the max count of zig zag' do
      bst = BinarySearchTree.new
      bst.add [ 5, 8, 7, 12, 9, 11, 10 ]

      expect(solution(bst.root)).to eq 3
    end
  end


end
