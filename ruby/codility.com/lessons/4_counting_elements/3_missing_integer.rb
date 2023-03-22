# Find the smallest positive integer that does not occur in a given sequence

require "set"

def solution1(input_list)
  filtered_list = input_list.filter(&:positive?)
                            .uniq
                            .sort

  filtered_list.each_with_index do |item, index|
    expected_item = index + 1
    return expected_item if item != expected_item
  end

  filtered_list.length + 1
end

def solution2 list
  seen = Set.new list
  max = list.max

  return 1 if max < 1

  (1..max).each do |item|
    return item unless seen.include?(item)
  end

  return max + 1
end
