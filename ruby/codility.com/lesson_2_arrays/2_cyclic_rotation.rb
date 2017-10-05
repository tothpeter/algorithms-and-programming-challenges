def solution2 list, n
  n = n % list.length if n >= list.length

  n.times do
    last_item = list.last

    i = list.length - 1

    while i > 0
      list[i] = list[i - 1]
      i -= 1
    end

    list[0] = last_item
  end
end
