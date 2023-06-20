# Compute number of integers divisible by k in range [a..b].

def solution bottom_limit, top_limit, number
  division_of_first_number = bottom_limit % number == 0 ? 1 : 0

  top_limit / number - bottom_limit / number + division_of_first_number
end


def solution2 bottom_limit, top_limit, number
  top_limit / number - (bottom_limit - 1) / number
end
