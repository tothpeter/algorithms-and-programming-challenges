# Find longest sequence of zeros in binary representation of an integer.

def solution1 n
  binary_numbers = n.to_s(2).chars
  binary_numbers.shift

  max         = 0
  current_max = 0

  binary_numbers.each do |binary_number|
    if binary_number == "1"
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

  zeros.inject(0){ |acc, gap| [acc, gap.length].max }
end
