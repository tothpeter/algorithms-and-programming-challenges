# Count factors of given number n.

def solution1 number
  sqrt = Math.sqrt(number)
  number_of_factors = sqrt.to_i == sqrt.ceil ? -1 : 0

  (1..sqrt).each do |factor|
    if number % factor == 0
      number_of_factors += 2
    end
  end

  number_of_factors
end
