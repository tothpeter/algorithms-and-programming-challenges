class SinglyLinkedList

  def initialize
    @root = nil
  end

  def add content
    new_node = SinglyLinkedListNode.new content
    if @root == nil
      @root = new_node
    else
      insert_at_the_end new_node
    end
  end

  def check_loop
    slow_runner = @root
    fast_runner = @root

    while fast_runner.next != nil
      slow_runner = slow_runner.next
      fast_runner = fast_runner.next.next

      if slow_runner == fast_runner
        return true
      end
    end

    return false
  end

  def reverse!
    current_node = @root
    prev_node = nil
    
    while current_node
      next_node = current_node.next
      current_node.next = prev_node
      prev_node = current_node
      current_node = next_node
    end

    @root = prev_node
  end

  protected

  def insert_at_the_end new_node
    last_node = @root

    while last_node.next != nil
      last_node = last_node.next
    end

    last_node.next = new_node
  end

end

class SinglyLinkedListNode
  attr_accessor :content, :next
  
  def initialize content = nil
    @content = content
  end
end