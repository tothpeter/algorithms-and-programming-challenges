# 0, 1, 2, 3, 4, 5, 6, 7,  8
# 0, 1, 1, 2, 3, 5, 8, 13, 21

class Fib
  def self.recursive n
    return n if n < 2

    recursive(n - 1) + recursive(n - 2)
  end

  def self.iterative n
    return n if n < 2

    item_0 = 0
    item_1 = 1
    current = nil

    (n - 1).times do
      current = item_0 + item_1
      item_0 = item_1
      item_1 = current
    end

    current
  end
end

class Fiber
  def initialize
    @memo = { 0 => 0, 1 => 1 }
  end

  def recursive_with_memoize n
    return @memo[n] if @memo.has_key? n

    @memo[n] = recursive_with_memoize(n - 1) + recursive_with_memoize(n - 2)
  end
end
