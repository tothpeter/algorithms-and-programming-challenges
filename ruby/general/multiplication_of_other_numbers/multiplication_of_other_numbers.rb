def exercise_with_one_loop input
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

def exercise_with_two_loops input
  result = [1] * input.length

  i = 1

  while i < input.length
    result[i] = result[i - 1] * input[i - 1]
    i += 1
  end

  multiplication_left = 1
  i = input.length - 2

  while i > -1
    multiplication_left = multiplication_left * input[i + 1]
    result[i] = multiplication_left * result[i]
    i -= 1
  end

  result
end