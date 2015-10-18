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