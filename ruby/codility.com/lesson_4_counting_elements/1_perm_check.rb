# Counting Elements / PermCheck
# Check whether array List is a permutation.

require 'set'

def solution1 list
  return 0 if list.empty?

  return 0 if list.any? { |item| item > list.length }

  actual_sum = list.inject :+
  expected_sum = (1 + list.length) * list.length / 2

  actual_sum == expected_sum ? 1 : 0
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
