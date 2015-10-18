require './singly_linked_list'

class SinglyLinkedList
  attr_accessor :root
end

describe SinglyLinkedList do
  describe '#add' do
    it 'adds the new item to the end of the list' do
      list = SinglyLinkedList.new
      list.add 1
      list.add 2
      list.add 3

      expect(list.root.content).to eq 1
      expect(list.root.next.next.content).to eq 3
    end
  end

  describe '#check_loop' do
    it 'returns true if there is a loop' do
      list = SinglyLinkedList.new
      list.add 1
      list.add 2
      list.add 3

      list.root.next.next.next = list.root

      expect(list.check_loop).to eq true
    end

    it 'returns false if there is no loop' do
      list = SinglyLinkedList.new
      list.add 1
      list.add 2
      list.add 3

      expect(list.check_loop).to eq false
    end
  end

  describe '#reverse' do
    context 'when we have many nodes' do
      it 'reverses the order of the list' do
        list = SinglyLinkedList.new
        list.add 1
        list.add 2
        list.add 3

        list.reverse!

        expect(list.root.content).to eq 3
        expect(list.root.next.content).to eq 2
        expect(list.root.next.next.content).to eq 1
        expect(list.root.next.next.next).to eq nil
      end
    end

    context 'when we have 2 nodes' do
      it 'reverses the order of the list' do
        list = SinglyLinkedList.new
        list.add 1
        list.add 2

        list.reverse!

        expect(list.root.content).to eq 2
        expect(list.root.next.content).to eq 1
        expect(list.root.next.next).to eq nil
      end
    end

    context 'when we have 1 node' do
      it 'reverses the order of the list' do
        list = SinglyLinkedList.new
        list.add 1

        list.reverse!

        expect(list.root.content).to eq 1
      end
    end
  end

end