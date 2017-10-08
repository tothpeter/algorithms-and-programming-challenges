# Rotate an array to the right by a given number of steps.

def solution1 list, n
  return list if list.length == 0 || n == 0

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

  list
end

def solution2 list, n
  list.rotate -n
end
