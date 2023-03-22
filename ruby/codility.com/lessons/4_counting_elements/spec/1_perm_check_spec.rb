require './1_perm_check'

context 'when there is a permutation' do
  it 'returns 1' do
    result = solution1([1,4,3,2])

    expect(result).to eq(1)
  end
end


context 'when there is NO permutation' do
  context 'sum is NOT okay' do
    it 'returns 0' do
      result = solution1([1,2,2])

      expect(result).to eq(0)
    end
  end

  context 'sum is okay but not unique' do
    it 'returns 0' do
      result = solution1([1,2,2,2,5])

      expect(result).to eq(0)
    end
  end

  it 'returns 0' do
    result = solution1([2,3,4])

    expect(result).to eq(0)
  end

  context 'sum is okay' do
    context 'not uniq max is NOT okay' do
      it 'returns 0' do
        result = solution1([1,2,2,5])

        expect(result).to eq(0)
      end
    end

    context 'not uniq max is okay' do
      it 'returns 0' do
        result = solution1([1,2,2,5,5,6])

        expect(result).to eq(0)
      end
    end

    context 'does not start with 1' do
      it 'returns 0' do
        result = solution1([2,2,2])

        expect(result).to eq(0)
      end
    end
  end
end
