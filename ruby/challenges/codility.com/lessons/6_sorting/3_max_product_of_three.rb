# Maximize A[P] * A[Q] * A[R] for any triplet (P, Q, R).

# time complexity is O(N*log(N))
# space complexity is O(1)
def solution1 list
  list.sort!

  three_bigest_numbers = list.last(3).reduce(:*)
  two_possible_negative_numbers_and_the_bigest = list[0] * list[1] * list.last

  [ three_bigest_numbers, two_possible_negative_numbers_and_the_bigest ].max
end

# time complexity is O(N)
# space complexity is O(1)
def solution2 list
  highestProductOf3 = list.first(3).reduce :*

  highest = [ list[0], list[1] ].max
  lowest  = [ list[0], list[1] ].min

  highestProductOf2 = list[0] * list[1]
  lowestProductOf2  = list[0] * list[1]

  (2..list.length-1).each do |index|
    item = list[index]

    highestProductOf3 = [
      highestProductOf3,
      item * highestProductOf2,
      item * lowestProductOf2
    ].max

    highestProductOf2 = [
      highestProductOf2,
      item * highest,
      item * lowest
    ].max

    lowestProductOf2 = [
      lowestProductOf2,
      lowest * item
    ].min

    highest = [ highest, item ].max
    lowest  = [ highest, item ].min
  end

  highestProductOf3
end
