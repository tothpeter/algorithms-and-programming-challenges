# Compute number of distinct values in an array.
require 'set'

def solution1 list
  seen = Set.new

  list.each do |item|
    seen.add item
  end

  seen.length
end


def solution2 list
  list.sort!

  last_item = nil
  result = 0

  list.each do |item|
    next if last_item == item
    result += 1
    last_item = item
  end

  result
end
