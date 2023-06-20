require './min_heap'

describe MinHeap do
  describe 'integration' do
    describe '#add' do
      it "adds the new elements to the right place" do
        heap = MinHeap.new

        expect(heap.peak).to eq(nil)

        heap.add_item 9
        expect(heap.peak).to eq(9)

        heap.add_item 3
        expect(heap.peak).to eq(3)


        heap.add_item 7
        expect(heap.peak).to eq(3)

        heap.add_item 9
        expect(heap.peak).to eq(3)

        heap.add_item 4
        expect(heap.peak).to eq(3)

        heap.add_item 2
        expect(heap.peak).to eq(2)
      end
    end

    describe '#poll' do
      it 'removes the smallest element and returns it' do
        heap = MinHeap.new

        heap.add_items [ 0, 2, 1, 4, 3, 5, 6, 7, 8, 9, 10 ]
        heap.items   = [ 0, 2, 1, 4, 3, 5, 6, 7, 8, 9, 10 ]

        expect(heap.poll).to eq(0)
        expect(heap.poll).to eq(1)
        expect(heap.poll).to eq(2)
        expect(heap.poll).to eq(3)
        expect(heap.poll).to eq(4)
        expect(heap.poll).to eq(5)
        expect(heap.poll).to eq(6)
        expect(heap.poll).to eq(7)
        expect(heap.poll).to eq(8)
        expect(heap.poll).to eq(9)
        expect(heap.poll).to eq(10)
        expect(heap.poll).to eq(nil)
      end
    end
  end

  describe 'helper methods' do
    before do
      @heap = MinHeap.new

      @heap.add_items [ 0, 2, 1, 4, 3, 5, 6, 7, 8, 9, 10 ]
      @heap.items   = [ 0, 2, 1, 4, 3, 5, 6, 7, 8, 9, 10 ]
    end

    let(:heap) { @heap }

    describe '#left_child_index' do
      it "returns the proper index" do
        expect(heap.send(:left_child_index, 0)).to eq(1)
        expect(heap.send(:left_child_index, 1)).to eq(3)
        expect(heap.send(:left_child_index, 2)).to eq(5)
        expect(heap.send(:left_child_index, 4)).to eq(9)
      end
    end

    describe '#right_child_index' do
      it "returns the proper index" do
        expect(heap.send(:right_child_index, 0)).to eq(2)
        expect(heap.send(:right_child_index, 1)).to eq(4)
        expect(heap.send(:right_child_index, 2)).to eq(6)
        expect(heap.send(:right_child_index, 4)).to eq(10)
      end
    end

    describe '#parent_index' do
      it "returns the proper index" do
        expect(heap.send(:parent_index, 1)).to eq(0)
        expect(heap.send(:parent_index, 2)).to eq(0)
        expect(heap.send(:parent_index, 8)).to eq(3)
        expect(heap.send(:parent_index, 9)).to eq(4)
      end
    end

    describe '#has_left_child?' do
      it "returns the proper index" do
        expect(heap.send(:has_left_child?, 0)).to eq(true)
        expect(heap.send(:has_left_child?, 6)).to eq(false)
        expect(heap.send(:has_left_child?, 7)).to eq(false)
      end
    end

    describe '#has_right_child?' do
      it "returns the proper index" do
        expect(heap.send(:has_right_child?, 0)).to eq(true)
        expect(heap.send(:has_right_child?, 6)).to eq(false)
        expect(heap.send(:has_right_child?, 7)).to eq(false)
      end
    end

    describe '#swap' do
      it "returns the proper index" do
        heap.send(:swap, 0, 2)

        expect(heap.items[0]).to eq(1)
        expect(heap.items[2]).to eq(0)
      end
    end
  end
end
