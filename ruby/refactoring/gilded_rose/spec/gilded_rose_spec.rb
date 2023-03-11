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

  describe 'Aged Brie' do
    it 'The Quality of an item is never more than 50' do
      item = Item.new('Aged Brie', 0, 49)

      items = [ item ]

      gilded_rose = GildedRose.new(items)

      2.times { gilded_rose.update_quality }

      expect(item.quality).to eq(50)
    end

    it 'inceases the quality by 1 before the sell by date' do
      item = Item.new('Aged Brie', 5, 1)

      items = [ item ]

      gilded_rose = GildedRose.new(items)

      5.times { gilded_rose.update_quality }

      expect(item.quality).to eq(6)
    end

    it 'inceases the quality by 2 after the sell by date' do
      item = Item.new('Aged Brie', 2, 1)

      items = [ item ]

      gilded_rose = GildedRose.new(items)

      4.times { gilded_rose.update_quality }

      expect(item.quality).to eq(7)
    end
  end
end
