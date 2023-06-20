# Find a maximum sum of a compact subsequence of array elements.

def solution1 list
  max = list.max
  return max if max < 0

  current_sum = 0

  list.each do |item|
    current_sum += item

    if current_sum < 0
      current_sum = 0
    else
      max = [ current_sum, max ].max
    end
  end

  max
end
