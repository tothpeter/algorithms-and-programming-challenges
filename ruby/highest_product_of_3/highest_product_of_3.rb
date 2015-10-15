def exercise input
  if input.length < 3
    raise Exception, 'Less than 3 items!'
    # ArgumentError
  end

  minus_lowest_1 = input[0]
  minus_lowest_2 = input[0]

  highest_1 = input[0]
  highest_2 = input[0]
  highest_3 = input[0]

  (1..input.length - 1).each do |i|
    if input[i] < 0
      if input[i] < minus_lowest_1
        minus_lowest_2 = minus_lowest_1
        minus_lowest_1 = input[i]
      elsif input[i] < minus_lowest_2
        minus_lowest_2 = input[i]
      end
    else
      if input[i] > highest_1
        highest_3 = highest_2
        highest_2 = highest_1
        highest_1 = input[i]
      elsif input[i] > highest_2
        highest_3 = highest_2
        highest_2 = input[i]
      elsif input[i] > highest_3
        highest_3 = input[i]
      end
    end
  end

  if minus_lowest_1 * minus_lowest_2 > highest_1 * highest_2
    minus_lowest_1 * minus_lowest_2 * highest_1
  else
    highest_1 * highest_2 * highest_3
  end
end