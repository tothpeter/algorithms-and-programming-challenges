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
end