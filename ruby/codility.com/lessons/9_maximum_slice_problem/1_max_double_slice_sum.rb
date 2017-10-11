# Find the maximal sum of any double slice.
# 12

def solution1 list
  return 0 if list.length < 4

  list_of_the_middle = list[1..-2]

  sum_of_middle = list_of_the_middle.inject :+

  max_1 = max_of_1 list_of_the_middle, sum_of_middle
  max_2 = max_of_2 list_of_the_middle, sum_of_middle
  max_3 = max_of_3 list_of_the_middle, sum_of_middle

  [ max_1, max_2, max_3 ].max
end


def max_of_1 list_of_the_middle, sum_of_middle
  current_list = list_of_the_middle.dup
  max = -Float::INFINITY

  while current_list.length > 0
    current_list.each do |item|
      max = [ max, sum_of_middle - item ].max
    end

    last_item = current_list.pop
    sum_of_middle -= last_item
  end

  max
end

def max_of_2 list_of_the_middle, sum_of_middle
  current_list = list_of_the_middle.dup
  max = -Float::INFINITY

  while current_list.length > 0
    current_list.each do |item|
      max = [ max, sum_of_middle - item ].max
    end

    first_item = current_list.shift
    sum_of_middle -= first_item
  end

  max
end

def max_of_3 list_of_the_middle, sum_of_middle
  current_list = list_of_the_middle.dup
  max = -Float::INFINITY

  while current_list.length > 2
    current_list.each do |item|
      max = [ max, sum_of_middle - item ].max
    end

    if current_list.length == 3
      max = [ max, current_list[1] ].max
      break
    end

    first_item = current_list.shift
    sum_of_middle -= first_item

    last_item = current_list.pop
    sum_of_middle -= last_item
  end

  max
end
