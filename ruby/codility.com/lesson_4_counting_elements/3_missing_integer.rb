# Find the smallest positive integer that does not occur in a given sequence

require "set"

def solution1 list
  seen = Set.new list
  max = list.max

  return 1 if max < 1

  (1..max).each do |item|
    return item unless seen.include?(item)
  end

  return max + 1
end
