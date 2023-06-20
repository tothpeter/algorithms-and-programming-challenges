class MinHeap
  attr_accessor :items

  def initialize
    @items = []
    @size  = 0
  end

  def add_item item
    @items[@size] = item

    @size += 1

    heapify_up
  end

  def add_items items
    items.each do |item|
      add_item item
    end
  end

  def peak
    @items.first
  end

  def poll
    return nil if @size == 0

    result = @items.first

    @items[0] = @items[@size - 1]

    @size -= 1

    heapify_down

    result
  end

  private

  def left_child_index parent_index
    2 * parent_index + 1
  end

  def right_child_index parent_index
    2 * parent_index + 2
  end

  def parent_index child_index
    (child_index - 1) / 2
  end

  def has_left_child? parent_index
    left_child_index(parent_index) < @size
  end

  def has_right_child? parent_index
    right_child_index(parent_index) < @size
  end

  def has_parent? child_index
    child_index > 0
  end

  def left_child parent_index
    @items[left_child_index(parent_index)]
  end

  def right_child parent_index
    @items[right_child_index(parent_index)]
  end

  def parent child_index
    @items[parent_index(child_index)]
  end

  def swap index_a, index_b
    @items[index_a], @items[index_b] = @items[index_b], @items[index_a]
  end

  def heapify_up
    current_index = @size - 1

    while has_parent?(current_index) && parent(current_index) > @items[current_index]
      parent_index = parent_index(current_index)

      swap(parent_index, current_index)
      current_index = parent_index
    end
  end

  def heapify_down
    current_index = 0

    while has_left_child?(current_index)
      smaller_child_index = left_child_index(current_index)

      if has_right_child?(current_index) && right_child(current_index) < left_child(current_index)
        smaller_child_index = right_child_index(current_index)
      end

      if @items[smaller_child_index] < @items[current_index]
        swap(smaller_child_index, current_index)
        current_index = smaller_child_index
      else
        break
      end
    end
  end
end
