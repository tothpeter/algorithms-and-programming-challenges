def solution1 string_a, string_b
  string_a, string_b = [ string_a, string_b ].sort_by &:length

  window = Hash.new { |h, k| h[k] = 0 }

  string_a.chars.each do |char|
    window[char] += 1
  end

  string_b.chars.first(string_a.length).each do |char|
    window[char] -= 1
    window.delete(char) if window[char] == 0
  end

  permutation_positions = []
  window_start_index = 0
  window_end_index   = string_a.length - 1

  permutation_positions << [ window_start_index, window_end_index ] if window.length == 0


  string_b.chars.drop(string_a.length).each do |char_enters_the_window|
    window_start_index += 1
    window_end_index   += 1
    char_leaves_the_window = string_b[window_start_index - 1]

    window[char_enters_the_window] -= 1
    window[char_leaves_the_window] += 1

    window.delete(char_enters_the_window) if window[char_enters_the_window] == 0
    window.delete(char_leaves_the_window) if window[char_leaves_the_window] == 0

    permutation_positions << [ window_start_index, window_end_index ] if window.length == 0
  end

  permutation_positions
end
