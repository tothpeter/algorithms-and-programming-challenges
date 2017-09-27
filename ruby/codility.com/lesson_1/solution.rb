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
  binary_numbers = n.to_s(2)

  only_zeros = binary_numbers.split("1")

  only_zeros.pop if binary_numbers[-1] != "1"

  only_zeros.inject(0){ |acc, s| [acc, s.length].max }
end
