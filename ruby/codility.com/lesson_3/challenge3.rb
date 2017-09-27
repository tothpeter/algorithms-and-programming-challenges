# Time Complexity / TapeEquilibrium

def solution list
  sum_of_left_part  = 0
  sum_of_right_part = list.inject(:+)

  min_difference = Float::INFINITY

  (list.length - 1).times do |i|
    sum_of_left_part  += list[i]
    sum_of_right_part -= list[i]

    current_difference = (sum_of_left_part - sum_of_right_part).abs

    min_difference = [ min_difference, current_difference ].min
  end

  min_difference
end
