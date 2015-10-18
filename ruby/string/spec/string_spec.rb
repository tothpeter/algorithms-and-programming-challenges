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

