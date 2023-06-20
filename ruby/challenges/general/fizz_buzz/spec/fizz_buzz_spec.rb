require './fizz_buzz'

describe FizzBuzz do
  it 'prints the correct string to the console' do
    outstream, errorstream = capture_io do
      FizzBuzz.simple
    end

    expect(outstream).to start_with('12Fizz4BuzzFizz78FizzBuzz11')
  end
end
