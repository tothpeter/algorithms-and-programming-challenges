# 0, 1, 1, 2, 3, 5, 8, 13, 21

class Fibonacci
  def self.recursive(nth_number)
    return nth_number if nth_number < 2

    recursive(nth_number - 1) + recursive(nth_number - 2)
  end

  def self.iterative(nth_number)
    return nth_number if nth_number < 2

    item_0 = 0
    item_1 = 1
    current = nil

    (nth_number - 1).times do
      current = item_0 + item_1
      item_0 = item_1
      item_1 = current
    end

    current
  end
end

class RecursiveFibonacciWithMemoize
  def self.recursive(nth_number)
    new.recursive(nth_number)
  end

  def initialize
    @memo = { 0 => 0, 1 => 1 }
  end

  def recursive(nth_number)
    return @memo[nth_number] if @memo.has_key?(nth_number)

    @memo[nth_number] = recursive(nth_number - 1) + recursive(nth_number - 2)
  end
end
