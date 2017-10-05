# Determine whether a given string of parentheses is properly nested.

def solution1 str
  return 1 if str.empty?

  pairs = {
    '{' => '}',
    '[' => ']',
    '(' => ')'
  }

  expected_closing_parentheses = []

  str.chars.each do |parentheses|
    if pairs.keys.include? parentheses
      expected_closing_parentheses << pairs[parentheses]
    else
      return 0 if expected_closing_parentheses.pop != parentheses
    end
  end

  return 1
end
