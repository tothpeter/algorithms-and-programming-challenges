require './multiplication_of_other_numbers'

describe 'exercise_with_one_loop' do
  it "returns the correct array" do
    input = [2, 3, 2, 3]
    expect(exercise_with_one_loop(input)).to eq [18, 12, 18, 12]

    input = [7, 1, 2, 6, 3]
    expect(exercise_with_one_loop(input)).to eq [36, 252, 126, 42, 84]
  end
end

describe 'exercise_with_two_loops' do
  it "returns the correct array" do
    input = [2, 3, 2, 3]
    expect(exercise_with_two_loops(input)).to eq [18, 12, 18, 12]

    input = [7, 1, 2, 6, 3]
    expect(exercise_with_two_loops(input)).to eq [36, 252, 126, 42, 84]
  end
end