class LRUCache
  def initialize max_item_count
    @max_item_count = max_item_count
    @head = nil
    @tail = nil
    @keymap = {}
    @item_count = 0
  end

  def add key, value
    if @item_count >= @max_item_count
      remove_last
    end

    insert_new key, value
  end

  def get key
    if @keymap.has_key? key
      set_last_used @keymap[key]
      @keymap[key].value
    else
      nil
    end
  end

  protected

  def insert_new key, value
    new_node = LRUCacheNode.new value, key

    if @item_count == 0
      @head = new_node
      @tail = new_node
      new_node.newer = @head
      new_node.older = @tail
    else
      @head.newer = new_node
      new_node.older = @head
      @head = new_node
    end

    @keymap[key] = new_node
    @item_count += 1
  end

  def remove_last
    @keymap.delete @tail.key
    penultimate_node = @tail.newer
    penultimate_node.older = @tail
    @tail = penultimate_node
    @item_count -= 1
  end

  def set_last_used node
    node.newer.older = node.older if node.newer
    node.older.newer = node.newer if node.older
    node.newer = nil
    node.older = @head

    @head.newer = node
    @head = node
  end
end

class LRUCacheNode
  attr_accessor :value, :key, :newer, :older

  def initialize value, key, newer = nil, older = nil
    @value = value
    @key = key
    @newer = newer
    @older = older
  end
end