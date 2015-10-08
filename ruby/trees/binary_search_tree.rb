class BinarySearchTreeNode
  attr_accessor :value, :left, :right
  
  def initialize value, left = nil, right = nil
    @value = value
    @left = left
    @right = right
  end
end

class BinarySearchTree
  def initialize value
    @root = BinarySearchTreeNode.new value
  end

  def add value
    add_recursive @root, value
  end

  def find_second_largest
    return find_second_largest_recursive @root
  end

  def find_second_largest_enhanced
    return find_second_largest_iterative @root
  end

  private

  def add_recursive node, value
    if value < node.value
      if node.left
        add_recursive node.left, value
      else
        node.left = BinarySearchTreeNode.new value
      end
    elsif value > node.value
      if node.right
        add_recursive node.right, value
      else
        node.right = BinarySearchTreeNode.new value
      end
    end

    return false
  end

  def find_second_largest_recursive node

    return nil if node == nil

    if node.left && !node.right
      return find_rightmost node.left
    end

    if node.right && !node.right.right && !node.right.left
      return node.value
    end

    return find_second_largest_recursive node.right
  end

  def find_rightmost node
    if node.right
      return find_rightmost node.right
    end
    
    return node.value
  end

  def find_second_largest_iterative node
    current_node = node

    if !node
      return nil
    end

    if !node.right
      return node.value
    end

    while current_node.right && current_node.right.right
      current_node = current_node.right
    end

    if current_node.right && !current_node.right.right && !current_node.right.left
      return current_node.value
    end

    current_node = current_node.right.left

    while current_node.right
      current_node = current_node.right
    end

    return current_node.value
  end

end