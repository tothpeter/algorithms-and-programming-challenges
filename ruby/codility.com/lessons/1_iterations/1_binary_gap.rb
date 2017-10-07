# Find longest sequence of zeros in binary representation of an integer.

def solution1 n
  binary_numbers = n.to_s(2).chars

  max         = 0
  current_max = 0

  binary_numbers.each do |binary_number|
    if binary_number == '1'
      max = [current_max, max].max

      current_max = 0
    else
      current_max += 1
    end
  end

  max
end


def solution2 n
  str = n.to_s(2)

  zeros = str.split('1')

  zeros.pop if str[-1] != "1"

  zeros.inject(0){ |max, gap| [max, gap.length].max }
end


def solution3 number
  while number > 0 && number % 2 == 0
    number /= 2
  end

  max_gap = 0
  current_gap = 0

  while number > 0
    reminder = number % 2

    if reminder == 1
      max_gap = [max_gap, current_gap].max
      current_gap = 0
    else
      current_gap += 1
    end

    number /= 2
  end

  max_gap
end
