class Fib
  # 0,1,1,2,3,5,8,13,21
  # 0,1,2,3,4,5,6,7, 8
  
  def self.recursive nth_number
    if nth_number == 0
      return 0
    elsif nth_number == 1
      return 1
    else
      return recursive(nth_number - 1) + recursive(nth_number - 2)
    end
  end

  def self.iterative nth_number
    if nth_number == 0
      return 0
    elsif nth_number == 1 || nth_number == 2
      return 1
    else
      item_0 = 0
      item_1 = 1
      current = 0

      (2..nth_number).each do
        current = item_0 + item_1
        item_0 = item_1
        item_1 = current
      end
      
      current
    end
  end
end

class Fiber

  def initialize
    @memo = {}
  end
  
  def recursive nth_number

    if nth_number == 0 || nth_number == 1
      return nth_number
    end
    
    if @memo.has_key? nth_number
      p "Grabbing memo for: #{nth_number}"
      return @memo[nth_number]
    end

    p "computing fib #{nth_number}"

    result = recursive(nth_number - 1) + recursive(nth_number - 2)

    # Memoize
    @memo[nth_number] = result

    return result
  end
end