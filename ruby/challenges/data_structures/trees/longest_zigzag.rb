# Find the longest zigzag from a binary tree

def solution node
  return 0 if node.nil?

  [ longest_zigzag(node.left, :left), longest_zigzag(node.right, :right) ].max
end

def longest_zigzag node, direction
  return 0 if node.nil?

  change_count_for_left  = longest_zigzag(node.left, :left)
  change_count_for_right = longest_zigzag(node.right, :right)

  if direction == :right
    change_count_for_left += 1 if node.left
   else
    change_count_for_right += 1 if node.right
  end

  [ change_count_for_left, change_count_for_right ].max
end


class BinarySearchTreeNode
  attr_accessor :value, :left, :right

  def initialize value, left = nil, right = nil
    @value = value
    @left = left
    @right = right
  end
end

class BinarySearchTree
  attr_reader :root

  def initialize root = nil
    @root = root
  end

  def add input
    if input.is_a? Array
      add_from_array input
    else
      add_single input
    end
  end

  private

  def add_from_array list
    list.each do |val|
      add_single val
    end
  end

  def add_single value
    if @root
      add_recursive @root, value
    else
      @root = BinarySearchTreeNode.new value
    end
  end

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
end
