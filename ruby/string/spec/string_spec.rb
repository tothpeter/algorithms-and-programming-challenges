require './string'

describe '#reverse_in_place!' do
  it 'reverses the string in place' do
    string = "Kalina Tech"

    expect(reverse_in_place!(string)).to eq "hceT anilaK"
  end

  it 'reverses the words in place' do
    string = "Kalina Tech"

    expect(reverse_words_in_place!(string)).to eq "Tech Kalina"
  end
end

describe '#any_palindrome?' do
  it 'returns true' do
    input = "civic"

    expect(any_palindrome?(input)).to eq true

    input = "ciiic"

    expect(any_palindrome?(input)).to eq true

    input = "ciic"

    expect(any_palindrome?(input)).to eq true
  end

  it 'returns false' do
    input = "cica"

    expect(any_palindrome?(input)).to eq false
  end
end

describe '#all_permutation_recursive' do
  it 'returns all permutation of a given string' do
    input = "asd"
    
    expected_output = [
      "asd",
      "ads",
      "sad",
      "sda",
      "das",
      "dsa",
    ]

    expect(all_permutation_recursive(input).sort).to eq expected_output.sort
  end

  it 'returns all permutation of a given string' do
    input = "as"
    
    expected_output = [
      "as",
      "sa",
    ]

    expect(all_permutation_recursive(input).sort).to eq expected_output.sort
  end
end