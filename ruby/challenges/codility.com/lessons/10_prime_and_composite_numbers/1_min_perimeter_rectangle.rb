# Find the minimal perimeter of any rectangle whose area equals N.

def solution1 area
  min = Float::INFINITY

  (1..Math.sqrt(area)).each do |side_a|

    if area % side_a == 0
      side_b = area / side_a
      min = [ 2 * (side_a + side_b), min ].min
    end
  end

  min
end
