require './min_heap'

describe MinHeap do
  # describe '#add' do
  #   it "works" do
  #     heap = MinHeap.new 100
  #
  #     expect(heap.min).to eq(nil)
  #
  #     heap.add 9
  #     expect(heap.min).to eq(9)
  #
  #     heap.add 3
  #     expect(heap.min).to eq(3)
  #
  #
  #     heap.add 7
  #     expect(heap.min).to eq(3)
  #
  #     heap.add 9
  #     expect(heap.min).to eq(3)
  #
  #     heap.add 4
  #     expect(heap.min).to eq(3)
  #
  #     heap.add 2
  #     expect(heap.min).to eq(2)
  #   end
  # end

  describe 'helper methods' do
    before do
      @heap = MinHeap.new

      @heap.add_items [ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ]
      @heap.items = [ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ]
    end

    let(:heap) { @heap }

    describe '#get_left_child_index' do
      it "works" do
        expect(heap.send(:get_left_child_index, 0)).to eq(1)
        expect(heap.send(:get_left_child_index, 1)).to eq(3)
        expect(heap.send(:get_left_child_index, 2)).to eq(5)
        expect(heap.send(:get_left_child_index, 4)).to eq(9)
      end
    end

    describe '#get_right_child_index' do
      it "works" do
        expect(heap.send(:get_right_child_index, 0)).to eq(2)
        expect(heap.send(:get_right_child_index, 1)).to eq(4)
        expect(heap.send(:get_right_child_index, 2)).to eq(6)
        expect(heap.send(:get_right_child_index, 4)).to eq(10)
      end
    end

    describe '#get_parent_index' do
      it "works" do
        expect(heap.send(:get_parent_index, 1)).to eq(0)
        expect(heap.send(:get_parent_index, 2)).to eq(0)
        expect(heap.send(:get_parent_index, 8)).to eq(3)
        expect(heap.send(:get_parent_index, 9)).to eq(4)
      end
    end

    describe '#has_left_child' do
      it "works" do
        expect(heap.send(:has_left_child, 0)).to eq(true)
        expect(heap.send(:has_left_child, 6)).to eq(false)
        expect(heap.send(:has_left_child, 7)).to eq(false)
      end
    end

    describe '#has_right_child' do
      it "works" do
        expect(heap.send(:has_right_child, 0)).to eq(true)
        expect(heap.send(:has_right_child, 6)).to eq(false)
        expect(heap.send(:has_right_child, 7)).to eq(false)
      end
    end

    describe '#swap' do
      it "works" do
        heap.send(:swap, 0, 2)

        expect(heap.items[0]).to eq(2)
        expect(heap.items[2]).to eq(0)
      end
    end
  end
end
