require './gilded_rose'

describe GildedRose do
  describe 'General items' do
    context 'when sell by date has NOT passed' do
      it 'lowers sell_in and quality by 1' do
        item = Item.new('GENERAL', 10, 10)

        items = [ item ]

        gilded_rose = GildedRose.new(items)

        2.times { gilded_rose.update_quality }

        expect(item.sell_in).to eq(8)
        expect(item.quality).to eq(8)
      end
    end

    context 'when sell by date has passed' do
      it 'lowers quality by 2' do
        item = Item.new('GENERAL', 0, 10)

        items = [ item ]

        gilded_rose = GildedRose.new(items)

        2.times { gilded_rose.update_quality }

        expect(item.quality).to eq(6)
      end
    end

    it 'The Quality of an item is never negative' do
      item = Item.new('GENERAL', 0, 0)

      items = [ item ]

      gilded_rose = GildedRose.new(items)

      2.times { gilded_rose.update_quality }

      expect(item.quality).to eq(0)
    end
  end
end
