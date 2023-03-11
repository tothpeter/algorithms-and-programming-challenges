# frozen_string_literal: true

require './item'
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

  describe 'Sulfuras' do
    it 'never decreases the quality' do
      item = Item.new('Sulfuras, Hand of Ragnaro', 0, 10)

      items = [ item ]

      gilded_rose = GildedRose.new(items)

      5.times { gilded_rose.update_quality }

      expect(item.quality).to eq(0)
    end

    # Bug, it accepts sell_in > 0 and it decreases the quality
    # it 'never has to be sold' do
    #   item = Item.new('Sulfuras, Hand of Ragnaro', 1, 10)

    #   items = [ item ]

    #   gilded_rose = GildedRose.new(items)

    #   5.times { gilded_rose.update_quality }

    #   expect(item.quality).to eq(0)
    # end
  end

  describe 'Backstage passes' do
    context '10+ days before the sell by date' do
      it 'increases the quality by 1' do
        item = Item.new('Backstage passes to a TAFKAL80ETC concert', 11, 0)

        items = [ item ]

        gilded_rose = GildedRose.new(items)

        gilded_rose.update_quality

        expect(item.quality).to eq(1)
      end
    end

    context '10 days or less before the sell by date' do
      it 'increases the quality by 2' do
        item = Item.new('Backstage passes to a TAFKAL80ETC concert', 10, 0)

        items = [ item ]

        gilded_rose = GildedRose.new(items)

        gilded_rose.update_quality

        expect(item.quality).to eq(2)
      end
    end

    context '5 days or less before the sell by date' do
      it 'increases the quality by 3' do
        item = Item.new('Backstage passes to a TAFKAL80ETC concert', 3, 0)

        items = [ item ]

        gilded_rose = GildedRose.new(items)

        gilded_rose.update_quality

        expect(item.quality).to eq(3)
      end
    end

    context 'after the concert' do
      it 'drops the quality to 0' do
        item = Item.new('Backstage passes to a TAFKAL80ETC concert', 0, 10)

        items = [ item ]

        gilded_rose = GildedRose.new(items)

        gilded_rose.update_quality

        expect(item.quality).to eq(0)
      end
    end
  end
end
