require './fibonacci'

describe Fib do
  describe ".recursive" do
    it "returns the nth fibonacci" do
      expect(Fib.recursive 0).to eq 0
      expect(Fib.recursive 1).to eq 1
      expect(Fib.recursive 2).to eq 1
      expect(Fib.recursive 5).to eq 5
      expect(Fib.recursive 7).to eq 13
      expect(Fib.recursive 8).to eq 21
    end
  end

  describe ".iterative" do
    it "returns the nth fibonacci" do
      expect(Fib.iterative 0).to eq 0
      expect(Fib.iterative 1).to eq 1
      expect(Fib.iterative 2).to eq 1
      expect(Fib.iterative 5).to eq 5
      expect(Fib.iterative 7).to eq 13
      expect(Fib.iterative 8).to eq 21
    end
  end
end

describe Fiber do
  describe ".recursive" do
    it "returns the nth fibonacci" do
      expect(Fiber.new.recursive 0).to eq 0
      expect(Fiber.new.recursive 1).to eq 1
      expect(Fiber.new.recursive 2).to eq 1
      expect(Fiber.new.recursive 5).to eq 5
      expect(Fiber.new.recursive 7).to eq 13
      expect(Fiber.new.recursive 8).to eq 21
    end
  end
end