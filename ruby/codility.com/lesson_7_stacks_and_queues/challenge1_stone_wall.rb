# Cover "Manhattan skyline" using the minimum number of rectangles.

def solution1 list_of_heights
  minimum_number_of_blocks = list_of_heights.length

  heights_to_merge = Hash.new { |h, k| h[k] = 0 }

  list_of_heights.each do |height|

    heights_to_merge.each do |height_to_merge, count|
      if height < height_to_merge
        heights_to_merge.delete height_to_merge
        minimum_number_of_blocks -= count - 1
      end
    end

    heights_to_merge[height] += 1
  end

  heights_to_merge.values.each do |count|
    minimum_number_of_blocks -= count - 1
  end

  minimum_number_of_blocks
end


def solution2 list_of_heights
  stack = []
  minimum_number_of_blocks = 0

  list_of_heights.each do |height|
    while stack.any? && height < stack.last
      minimum_number_of_blocks += 1
      stack.pop
    end

    if stack.empty? || height > stack.last
      stack << height
    end
  end

  minimum_number_of_blocks + stack.length
end
