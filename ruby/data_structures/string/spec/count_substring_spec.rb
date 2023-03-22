# We have a random string, the task is to answer how many at least two character long substrings does it contain which has maximum two different letters.
#
# Example:
#     'aabaccb'
#         ['aa', 'aab', 'ab', 'aaba', 'aba', 'ba', 'ac', 'acc', 'cc', 'ccb', 'cb'] -> 11
#     'abcabc'
#         ['ab', 'bc', 'ca', 'ab', 'bc'] -> 5

require './count_substring'

describe '#count_substrings' do
  it 'returns the right number of substrings' do
    string = "aabaccb"
    expect(count_substrings(string)).to eq 11

    string = "abcabc"
    expect(count_substrings(string)).to eq 5

    string = "bacbcdedab"
    expect(count_substrings(string)).to eq 11
  end
end
