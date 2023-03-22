require './fizz_buzz'

describe FizzBuzz do
  describe ".sample" do
    it "returns the correct result in string" do
      outstream, errorstream = capture_io do
        FizzBuzz.simple
      end

      result = outstream.split ', '

      expect(result[0]).to eq "1"
      expect(result[1]).to eq "2"
      expect(result[2]).to eq "Fizz"
      expect(result[4]).to eq "Buzz"
      expect(result[14]).to eq "FizzBuzz"
      expect(result[29]).to eq "FizzBuzz"
      expect(result[99]).to eq "Buzz\n"
      expect(result.length).to eq 100
    end
  end
end