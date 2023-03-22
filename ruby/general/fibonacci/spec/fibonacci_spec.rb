require './fibonacci'

describe Fib do
  describe ".recursive" do
    it "returns the nth fibonacci number" do
      expect(Fib.recursive(0)).to eq(0)
      expect(Fib.recursive(1)).to eq(1)
      expect(Fib.recursive(2)).to eq(1)
      expect(Fib.recursive(5)).to eq(5)
      expect(Fib.recursive(7)).to eq(13)
      expect(Fib.recursive(8)).to eq(21)
    end
  end

  describe ".iterative" do
    it "returns the nth fibonacci number" do
      expect(Fib.iterative(0)).to eq(0)
      expect(Fib.iterative(1)).to eq(1)
      expect(Fib.iterative(2)).to eq(1)
      expect(Fib.iterative(5)).to eq(5)
      expect(Fib.iterative(7)).to eq(13)
      expect(Fib.iterative(8)).to eq(21)
    end
  end
end

describe Fiber do
  describe "#recursive_with_memoize" do
    it "returns the nth fibonacci number" do
      expect(Fiber.new.recursive_with_memoize(0)).to eq(0)
      expect(Fiber.new.recursive_with_memoize(1)).to eq(1)
      expect(Fiber.new.recursive_with_memoize(2)).to eq(1)
      expect(Fiber.new.recursive_with_memoize(5)).to eq(5)
      expect(Fiber.new.recursive_with_memoize(7)).to eq(13)
      expect(Fiber.new.recursive_with_memoize(8)).to eq(21)
    end

    it "runs fast" do
      expect(Fiber.new.recursive_with_memoize(60)).to eq(1548008755920)
    end
  end
end
