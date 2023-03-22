require './3_missing_integer'

# #####################################################
# SOLUTION 1
context 'where tehre is no gap, only positive items' do
  it 'returns the last item + 1' do
    input_list = [1, 2, 3]
    result = solution1(input_list)

    expect(result).to eq(4)
  end
end

context 'when there is a gap' do
  it 'returns the gap' do
    input_list = [1, 2, 4]
    result = solution1(input_list)

    expect(result).to eq(3)
  end

  context 'when the list has not only positive items' do
    it 'returns the gap' do
      input_list = [1, 2, 4, 0, -1]
      result = solution1(input_list)

      expect(result).to eq(3)
    end
  end
end

context 'when the list has duplicates' do
  it 'returns 5' do
    input_list = [1, 3, 6, 4, 1, 2]
    result = solution1(input_list)

    expect(result).to eq(5)
  end
end

context 'when the list has only negative items' do
  it 'returns 5' do
    input_list = [-1, -2]
    result = solution1(input_list)

    expect(result).to eq(1)
  end
end


# #####################################################
# SOLUTION 2
context 'where tehre is no gap, only positive items' do
  it 'returns the last item + 1' do
    input_list = [1, 2, 3]
    result = solution2(input_list)

    expect(result).to eq(4)
  end
end

context 'when there is a gap' do
  it 'returns the gap' do
    input_list = [1, 2, 4]
    result = solution2(input_list)

    expect(result).to eq(3)
  end

  context 'when the list has not only positive items' do
    it 'returns the gap' do
      input_list = [1, 2, 4, 0, -1]
      result = solution2(input_list)

      expect(result).to eq(3)
    end
  end
end

context 'when the list has duplicates' do
  it 'returns 5' do
    input_list = [1, 3, 6, 4, 1, 2]
    result = solution2(input_list)

    expect(result).to eq(5)
  end
end

context 'when the list has only negative items' do
  it 'returns 5' do
    input_list = [-1, -2]
    result = solution2(input_list)

    expect(result).to eq(1)
  end
end
