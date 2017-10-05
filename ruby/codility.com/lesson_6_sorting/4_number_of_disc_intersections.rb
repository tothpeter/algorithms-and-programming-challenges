# Find the minimal average of any slice containing at least two elements.

def solution1 list_of_discs
  changes = Hash.new { |h, k| h[k] = [] }

  list_of_discs.each_with_index do |radius, center|
      left_edge  = center - radius
      right_edge = center + radius

      changes[left_edge]  << :start
      changes[right_edge] << :end
  end

  changes = changes.sort_by { |key, _| key }
  changes.map! { |_, local_changes| local_changes.sort.reverse  }
  changes.flatten!

  number_of_intersects = 0
  active_discs = 0

  changes.each do |change|
    if change == :start
      number_of_intersects += active_discs
      active_discs += 1
    else
      active_discs -= 1
    end

    return -1 if number_of_intersects > 10_000_000
  end

  number_of_intersects
end


def solution2 list_of_discs
  changes = Hash.new { |h, k| h[k] = { start: 0, end: 0 } }

  list_of_discs.each_with_index do |radius, center|
      left_edge  = center - radius
      right_edge = center + radius

      changes[left_edge][:start] += 1
      changes[right_edge][:end]  += 1
  end

  sorted_changes = changes.sort

  number_of_intersects = 0
  active_discs = 0

  sorted_changes.each do |_position, local_changes|
    number_of_intersects_with_active_discs = active_discs * local_changes[:start]
    number_of_intersects_of_the_new_discs  = (local_changes[:start] * (local_changes[:start] - 1)) / 2

    number_of_intersects += number_of_intersects_with_active_discs + number_of_intersects_of_the_new_discs

    active_discs += local_changes[:start]
    active_discs -= local_changes[:end]

    return -1 if number_of_intersects > 10_000_000
  end

  number_of_intersects
end


def solution3 list_of_discs
  discs_count = list_of_discs.length
  left_edges = []
  right_edges = []

  list_of_discs.each_with_index do |radius, center|
      left_edge  = center - radius
      right_edge = center + radius

      left_edges[center] = left_edge
      right_edges[center] = right_edge
  end

  right_edges.sort!
  left_edges.sort!

  left_edge_index = 0
  intersect_count = 0

  discs_count.times do |right_edge_index|
    while left_edge_index < discs_count && right_edges[right_edge_index] >= left_edges[left_edge_index]
      left_edge_index += 1
    end

    intersect_count += left_edge_index - right_edge_index - 1

    return -1 if intersect_count > 10_000_000
  end

  intersect_count
end
