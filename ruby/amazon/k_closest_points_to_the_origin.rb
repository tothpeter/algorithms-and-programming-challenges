# K Closest Points to the Origin

require 'set'

def solution1(points, k)
  distances_with_point = []

  points.each do |x, y|
    distances_with_point << { distance: x * x + y * y, point: [x, y] }
  end

  distances_with_point.sort_by! { |a| a[:distance] }

  distances_with_point.first(k).map {|a| a[:point]}
end


# WIP
def solution2(points, k)
  result = points.take(k)

  distances = points.map { |x, y| x * x + y * y }
  min_distances = SortedSet.new distances

  (k..points.length-1).each do |index|
    point    = points[index]
    distance = distances[index]

    if a.min

    end
  end

  p result.to_a

  result
end
