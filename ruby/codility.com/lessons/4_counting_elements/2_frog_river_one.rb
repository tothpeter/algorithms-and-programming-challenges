# frozen_string_literal: true

# Find the earliest time when a frog can jump to the other side of a river.
# https://app.codility.com/programmers/lessons/4-counting_elements/frog_river_one/

require 'set'

# 100% score on Codility
def solution(end_position, leaves)
  necessary_positions = Set.new(1..end_position)

  leaves.each_with_index do |position, time|
    necessary_positions.delete(position)

    return time if necessary_positions.empty?
  end

  return -1
end
