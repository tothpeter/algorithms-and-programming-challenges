require './1_perm_check'

describe 'Solution #1' do
  context 'when there is a permutation' do
    it 'returns 1' do
      result = Solution.solution1([1,4,3,2])

      expect(result).to eq(1)
    end
  end


  context 'when there is NO permutation' do
    context 'sum is NOT okay' do
      it 'returns 0' do
        result = Solution.solution1([1,2,2])

        expect(result).to eq(0)
      end
    end

    context 'sum is okay but contains duplicates' do
      it 'returns 0' do
        result = Solution.solution1([1,2,2,2,5])

        expect(result).to eq(0)
      end
    end

    context 'does not start with 1' do
      it 'returns 0' do
        result = Solution.solution1([2,3,4])

        expect(result).to eq(0)
      end
    end

    context 'sum is okay' do
      context 'max is NOT okay and contains duplicates' do
        it 'returns 0' do
          result = Solution.solution1([1,2,2,5])

          expect(result).to eq(0)
        end
      end

      context 'max is okay but contains duplicates' do
        it 'returns 0' do
          result = Solution.solution1([1,2,2,5,5,6])

          expect(result).to eq(0)
        end
      end
    end
  end
end
