def count_substrings input_string
  substrings_count = 0

  (0..input_string.length-2).each do |i|
    discovered_letters = { input_string[i] => true }

    j = i + 1
    while j < input_string.length
      discovered_letters[input_string[j]] = true
      break if discovered_letters.length > 2

      substrings_count += 1
      j += 1
    end
  end

  substrings_count
end
