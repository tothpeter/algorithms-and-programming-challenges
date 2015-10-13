require './multiplication_of_other_numbers'

describe 'exercise' do
  it "returns the correct array" do
    input = [2, 3, 2, 3]
    expect(exercise(input)).to eq [18, 12, 18, 12]

    input = [7, 1, 2, 6, 3]
    expect(exercise(input)).to eq [36, 252, 126, 42, 84]
  end
end