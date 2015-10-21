class BinarySearchTreeNode
  attr_accessor :value, :left, :right
  
  def initialize value, left = nil, right = nil
    @value = value
    @left = left
    @right = right
  end
end

class BinarySearchTree
  def initialize
    @root = nil
  end

  def add input
    if input.is_a? Array
      add_from_array input
    else
      add_single input
    end
  end

  def find_second_largest
    return find_second_largest_recursive @root
  end

  def find_second_largest_enhanced
    return find_second_largest_iterative @root
  end

  def height_recursive
    height_of_node_recursive(@root) - 1
  end

  def height_iterative
    height_of_node_iterative @root
  end

  def width_recursive
    height_of_node_recursive(@root.left) + height_of_node_recursive(@root.right)
  end

  def superbalanced?
    max_depth = 0
    min_depth = Float::INFINITY
    node_tuples = [ [@root, 0] ]

    if @root.right && @root.right.right && @root.left == nil || @root.left && @root.left.left && @root.right == nil
      return false
    end

    while node_tuples.length > 0
      current_tuple = node_tuples.shift
      current_node = current_tuple[0]
      current_level = current_tuple[1]

      if current_node.left == nil && current_node.right == nil
        if current_level > max_depth
          max_depth = current_level
        end

        if current_level < min_depth
          min_depth = current_level
        end

        if (max_depth - min_depth) > 1
          return false
        end

        next
      end
      
      if current_node.left != nil
        node_tuples << [current_node.left, current_level + 1]
      end

      if current_node.right != nil
        node_tuples << [current_node.right, current_level + 1]
      end
    end

    return (max_depth - min_depth) <= 1
  end


  private

  def height_of_node_recursive node
    if node == nil
      0
    else
      return [height_of_node_recursive(node.left), height_of_node_recursive(node.right)].max + 1
    end
  end

  def height_of_node_iterative node
    max = 0
    node_tuples = [[node,0]]

    while node_tuples.length > 0
      current_tuple = node_tuples.shift
      current_node = current_tuple[0]
      current_level = current_tuple[1]
      
      if current_node.left != nil
        node_tuples << [current_node.left, current_level + 1]
      end

      if current_node.right != nil
        node_tuples << [current_node.right, current_level + 1]
      end

      max = [current_level, max].max
    end

    max
  end

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