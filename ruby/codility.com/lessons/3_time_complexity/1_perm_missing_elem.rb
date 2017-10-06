# Find the missing element in a given permutation.

def solution list
  return 1 if list.empty?

  current_sum_of_list = list.inject :+

  expected_sum_of_list = (list.first + list.last) * (list.length + 1) / 2

  expected_sum_of_list - current_sum_of_list
end
