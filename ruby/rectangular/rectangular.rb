def exercise rectangular1, rectangular2
  rectangulars_intersection = {}

  rectangulars_intersection[:x], rectangulars_intersection[:width] = find_overlap rectangular1[:x], rectangular2[:x], rectangular1[:width]
  rectangulars_intersection[:y], rectangulars_intersection[:height] = find_overlap rectangular1[:y], rectangular2[:y], rectangular1[:height]

  if rectangulars_intersection[:width] < 0 || rectangulars_intersection[:height] < 0
    return nil
  end

  rectangulars_intersection
end

def find_overlap point1, point2, length1
  overlap_length = point1 + length1 - point2
  overlap_point = point1 + length1 - overlap_length

  [overlap_point, overlap_length]
end