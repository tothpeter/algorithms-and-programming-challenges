def find_unique_integer(list)
  result = list.first

  (1..list.length - 1).each do |i|
    result = result ^ list[i]
  end

  result
end
