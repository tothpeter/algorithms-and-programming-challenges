# Find the maximal sum of any double slice.

def solution1 list
  return 0 if list.length < 4

  list = list[1..-2]

  best_sums_before = build_best_sums_of list[0..-2]
  best_sums_after  = build_best_sums_of(list.reverse[0..-2]).reverse

  max = -Float::INFINITY

  best_sums_before.zip(best_sums_after) do |best_sum_before, best_sum_after|
    max = [ best_sum_before + best_sum_after, max ].max
  end

  max
end

def build_best_sums_of list
  best_sums = [ 0 ]

  list.each do |item|
    best_sum = [ 0, best_sums.last + item ].max

    best_sums << best_sum
  end

  best_sums
end
