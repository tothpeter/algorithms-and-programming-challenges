# Check whether array `numbers` is a permutation
# https://app.codility.com/programmers/lessons/4-counting_elements/perm_check/

require 'set'

class Solution
  def self.solution1(numbers)
    # Does it start from one?
    return 0 if numbers.min != 1
    # Does it end with the right element?
    return 0 if numbers.max != numbers.length
    # Does it contain duplicates?
    return 0 if numbers.uniq.length != numbers.length

    1
  end


  def self.solution2(numbers)
    return 0 if numbers.min != 1

    seen = {}

    numbers.each do |item|
      return 0 if item > numbers.length
      seen[item] = true
    end

    numbers.length == seen.length ? 1 : 0
  end

  def self.solution3(numbers)
    return 0 if numbers.min != 1

    expected_numbers = Set.new(1..(numbers.length))

    numbers.each do |item|
      expected_numbers.delete(item)
    end

    if expected_numbers.empty?
      return 1
    else
      return 0
    end
  end
end
