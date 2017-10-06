# Find an index of an array such that its value occurs at more than half of indices in the array.

def solution1 list
  return -1 if list.empty?

  size = 0
  candidate = nil
  candidate_index = nil

  list.each_with_index do |item, index|
    if item == candidate
      size += 1
    else
      if size == 0
        candidate = item
        candidate_index = index
        size += 1
      else
        size -= 1
      end
    end
  end

  number_of_candidate = list.count candidate

  if number_of_candidate > list.length / 2
    candidate_index
  else
    -1
  end
end
