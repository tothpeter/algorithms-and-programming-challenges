# frozen_string_literal: true

# Find longest sequence of zeros in binary representation of an integer.

def solution1(decimal_number)
  binary_digits  = decimal_number.to_s(2)

  max_gap     = 0
  currant_gap = 0

  binary_digits.chars.each do |binary_number|
    if binary_number == '1'
      max_gap = [currant_gap, max_gap].max
      currant_gap = 0
    else
      currant_gap += 1
    end
  end

  max_gap
end


def solution2(decimal_number)
  binary_digits = decimal_number.to_s(2)

  gaps = binary_digits.split('1')

  gaps.pop if binary_digits.chars.last != '1'

  gaps_lengths = gaps.map!(&:length)

  gaps_lengths.max || 0

  # gaps.inject(0){ |max, gap| [max, gap.length].max }
end


def solution3(decimal_number)
  while decimal_number > 0 && decimal_number % 2 == 0
    decimal_number /= 2
  end

  max_gap     = 0
  current_gap = 0

  while decimal_number > 0
    reminder = decimal_number % 2

    if reminder == 1
      max_gap = [max_gap, current_gap].max
      current_gap = 0
    else
      current_gap += 1
    end

    decimal_number /= 2
  end

  max_gap
end
