def exercise input
  result = [1] * input.length

  i = 1
  j = input.length - 2

  multiplication_left = 1
  multiplication_right = 1

  while i < input.length
    multiplication_left = multiplication_left * input[i - 1]
    result[i] = multiplication_left * result[i]
    
    multiplication_right = multiplication_right * input[j + 1]
    result[j] = multiplication_right * result[j]

    i += 1
    j -= 1
  end

  result
end