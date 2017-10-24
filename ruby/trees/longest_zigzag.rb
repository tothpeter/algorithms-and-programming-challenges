# Find the longest zigzag from a binary tree

def solution node
  return 0 if node.nil?

  [ longest_zigzag(node.left, :left)[:change_count], longest_zigzag(node.right, :right)[:change_count] ].max
end

def longest_zigzag node, direction
  return { node_count: 0, change_count: 0 } if node.nil?

  left = longest_zigzag(node.left, :left)
  right = longest_zigzag(node.right, :right)

  if direction == :left
    right[:change_count] += 1 if right[:node_count] > 0
   else
    left[:change_count] += 1 if left[:node_count] > 0
  end

  if right[:change_count] > left[:change_count]
    right[:node_count] += 1
    right
  else
    left[:node_count] += 1
    left
  end
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
