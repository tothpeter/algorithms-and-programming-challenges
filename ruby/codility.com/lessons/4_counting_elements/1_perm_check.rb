# Check whether array List is a permutation.

require 'set'

def solution1(input_list)
  # Does it start from one?
  return 0 if input_list.min != 1
  # Does it end with the right element?
  return 0 if input_list.max != input_list.length
  # Is it uniqe?
  return 0 if input_list.uniq.length != input_list.length

  1
end


def solution2 list
  return 0 if list.empty?

  seen = {}

  list.each do |item|
    return 0 if item > list.length
    seen[item] = true
  end

  list.length == seen.length ? 1 : 0
end

def solution3 list
  return 0 if list.empty?

  set = Set.new(1..(list.length))

  list.each do |item|
    set.delete item
  end

  if set.empty?
    return 1
  else
    return 0
  end
end
