class MinHeap
  attr_accessor :items

  def initialize
    @items    = []
    @size     = 0
  end

  def add_item item
    @size += 1
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
    return nil if size == 0

    result = @items.first



    result
  end

  private

  def get_left_child_index parent_index
    2 * parent_index + 1
  end

  def get_right_child_index parent_index
    2 * parent_index + 2
  end

  def get_parent_index child_index
    (child_index - 1) / 2
  end

  def has_left_child parent_index
    get_left_child_index(parent_index) < @size
  end

  def has_right_child parent_index
    get_right_child_index(parent_index) < @size
  end

  def has_parent child_index
    get_parent_index(child_index) >= 0
  end

  def get_left_child parent_index
    @items[get_left_child_index(parent_index)]
  end

  def get_right_child parent_index
    @items[get_right_child_index(parent_index)]
  end

  def get_parent child_index
    @items[get_parent_index(child_index)]
  end

  def swap index_a, index_b
    @items[index_a], @items[index_b] = @items[index_b], @items[index_a]
  end
end
