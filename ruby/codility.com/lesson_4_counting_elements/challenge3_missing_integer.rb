# Counting Elements / MissingInteger
# Find the smallest positive integer that does not occur in a given sequence

require "set"

# Optimized for computing
def solution1 list
  seen = Set.new list
  max = list.max

  return 1 if max < 1

  (1..max).each do |item|
    return item unless seen.include?(item)
  end

  return max + 1
end

# Optimized for storage
def solution2 list
  min = 1

  list.select! &:positive?
  list = list.uniq.sort

  list.length.times do |index|
    if list[index] != min
      return index + 1
    end

    min += 1
  end

  min
end
