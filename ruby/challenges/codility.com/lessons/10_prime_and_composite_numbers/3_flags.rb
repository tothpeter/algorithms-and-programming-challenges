# Count factors of given number n.
# 55

def solution1 list

  peak_indexes = []

  (1..list.length-2).each do |index|
    item = list[index]

    if list[index - 1] < list[index] && list[index] > list[index + 1]
      peak_indexes << index
      next 2
    end
  end

  min_distance = Float::INFINITY

  # distances = Hash.new { |h, k| h[k] = 0 }

  (1..peak_indexes.length-1).each do |index|
    current_distance = peak_indexes[index] - peak_indexes[index - 1]
    # distances[current_distance] += 1

    min_distance = [ current_distance, min_distance].min
  end

  result = min_distance

  (min_distance+1..Math.sqrt(peak_indexes.length)).each do |sub_result|
    
  end

  p peak_indexes
  p min_distance

  result
end
