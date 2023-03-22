# Split the given integer array into 2 parts by the rule:
# each number in the second part has to be bigger than any number in the first part
# return the length of the first part

def solution numbers
  possible_max_in_the_first_part = numbers.first
  max_in_the_first_part          = numbers.first
  length_of_the_first_part       = 1

  numbers[1..-2].each_with_index do |number, index|
    possible_max_in_the_first_part = [ number, possible_max_in_the_first_part ].max

    if number <= max_in_the_first_part
      max_in_the_first_part = possible_max_in_the_first_part
      length_of_the_first_part = index + 2
    end

  end

  length_of_the_first_part
end
