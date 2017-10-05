# Determine whether given string of parentheses is properly nested.

# Time complexity:  O(n)
# Space complexity: O(1)
def solution1 str
  return 1 if str.empty?

  counter = 0

  str.chars.each do |char|
    if char == '('
      counter += 1
    else
      counter -= 1

      return 0 if counter < 0
    end
  end

  counter == 0 ? 1 : 0
end

# Time complexity:  O(n)
# Space complexity: O(n)
def solution2 str
  return 1 if str.empty?

  stack = []

  str.chars.each do |char|
    if char == '('
      stack << '('
    else
      return 0 if stack.pop != '('
    end
  end

  stack.empty? ? 1 : 0
end
