# Counting Elements / FrogRiverOne
# Find the earliest time when a frog can jump to the other side of a river.

require 'set'

def solution end_position, leaves
  path = Set.new

  leaves.each_with_index do |position, time|
    path.add position

    return time if path.length == end_position
  end

  return -1
end
