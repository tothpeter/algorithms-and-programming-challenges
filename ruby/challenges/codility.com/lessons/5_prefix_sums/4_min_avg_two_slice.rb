# Find the minimal average of any slice containing at least two elements.

def solution list
  min_index = 0
  min_avg = (list[0] + list[1]) / 2.0

  list.each_cons(2).each_with_index do |pair, index|
    avg = (pair[0] + pair[1]) / 2.0

    if avg < min_avg
      min_index = index
      min_avg   = avg
    end
  end

  list.each_cons(3).each_with_index do |pair, index|
    avg = (pair[0] + pair[1] + pair[2]) / 3.0

    if min_avg == avg && min_index > index || avg < min_avg
      min_index = index
      min_avg   = avg
    end
  end

  min_index
end
