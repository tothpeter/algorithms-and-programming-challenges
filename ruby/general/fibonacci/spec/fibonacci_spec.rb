require './fibonacci'

describe Fibonacci do
  describe 'recursive' do
    it 'returns the nth fibonacci number' do
      expect(described_class.recursive(0)).to eq(0)
      expect(described_class.recursive(1)).to eq(1)
      expect(described_class.recursive(2)).to eq(1)
      expect(described_class.recursive(5)).to eq(5)
      expect(described_class.recursive(7)).to eq(13)
      expect(described_class.recursive(8)).to eq(21)
    end
  end

  describe 'iterative' do
    it 'returns the nth fibonacci number' do
      expect(described_class.iterative(0)).to eq(0)
      expect(described_class.iterative(1)).to eq(1)
      expect(described_class.iterative(2)).to eq(1)
      expect(described_class.iterative(5)).to eq(5)
      expect(described_class.iterative(7)).to eq(13)
      expect(described_class.iterative(8)).to eq(21)
    end
  end
end

describe RecursiveFibonacciWithMemoize do
  it 'returns the nth Fibonacci number' do
    expect(described_class.recursive(0)).to eq(0)
    expect(described_class.recursive(1)).to eq(1)
    expect(described_class.recursive(2)).to eq(1)
    expect(described_class.recursive(5)).to eq(5)
    expect(described_class.recursive(7)).to eq(13)
    expect(described_class.recursive(8)).to eq(21)
  end

  it 'runs fast' do
    expect(described_class.recursive(60)).to eq(1548008755920)
  end
end
