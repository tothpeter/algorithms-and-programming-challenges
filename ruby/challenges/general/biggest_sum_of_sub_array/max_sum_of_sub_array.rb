# input = [-1, -2, 3, 4, -5, 6]

def exercise input
  result = {
    first_index: 0,
    last_index: 0,
    sum: input[0]
  }

  current_first_index = 0
  current_last_index = 0
  current_sum = input[0]

  (1..input.length - 1).each do |i|
    if current_sum < 0
      current_first_index = i
      current_last_index = i
      current_sum = input[i]
    else
      current_last_index = i
      current_sum += input[i]
    end

    if result[:sum] < current_sum
      result[:first_index] = current_first_index
      result[:last_index] = current_last_index
      result[:sum] = current_sum
    end
  end

  result
end