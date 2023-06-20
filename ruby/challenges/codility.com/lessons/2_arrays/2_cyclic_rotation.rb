# frozen_string_literal: true

# Rotate an array to the right by a given number of steps.

def solution_copy_one_by_one(list, rotate_by)
  return list if list.length == 0 || rotate_by == 0

  new_list = list.dup

  rotate_by = rotate_by % new_list.length

  rotate_by.times do
    last_item = new_list.last

    current_index = new_list.length - 1

    while current_index > 0
      new_list[current_index] = new_list[current_index - 1]
      current_index -= 1
    end

    new_list[0] = last_item
  end

  new_list
end

def solution_splitting(list, rotate_by)
  return list if list.length == 0 || rotate_by == 0

  rotate_by = rotate_by % list.length

  new_right = list.take(list.length - rotate_by)
  new_left  = list.slice(list.length - rotate_by, rotate_by)

  new_left + new_right
end

def solution_built_in(list, rotate_by)
  list.rotate -rotate_by
end
