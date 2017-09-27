def solution1 list
  result = 0

  list.each do |item|
    result ^= item
  end

  result
end
