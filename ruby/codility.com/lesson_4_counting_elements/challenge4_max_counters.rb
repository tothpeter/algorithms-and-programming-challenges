# Counting Elements / MaxCounters
# Calculate the values of counters after applying all alternating operations: increase counter by 1; set value of all counters to current maximum.

# Not so performant O(operations * counters_count)
def solution1 counters_count, operations
  counters = Array.new counters_count, 0
  max = 0

  operations.each do |operation|
    if operation <= counters_count
      counters[operation - 1] += 1
      max = [ max, counters[operation - 1] ].max
    else
      counters.map! { |item| item = max }
    end
  end

  counters
end

# Optimized for computing O(operations + counters_count)
def solution2 counters_count, operations
  counters = Array.new counters_count, 0
  last_max_level_set_to = 0
  max = 0

  operations.each do |operation|
    if operation <= counters_count
      counter = counters[operation - 1]

      if counter < last_max_level_set_to
        counter = last_max_level_set_to
      end

      counter += 1

      counters[operation - 1] = counter

      max = counter if counter > max
    else
      last_max_level_set_to = max
    end
  end

  counters.each_with_index do |item, index|
    counters[index] = last_max_level_set_to if item < last_max_level_set_to
  end

  counters
end
