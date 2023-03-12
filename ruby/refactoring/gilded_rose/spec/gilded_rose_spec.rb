# frozen_string_literal: true

require './item'
require './aged_brie_item'
require './backstage_passes_item'
require './conjured_item'
require './general_item'
require './sulfuras_item'

require './gilded_rose'

describe GildedRose do
  describe 'General items' do
    context 'when sell by date has NOT passed' do
      it 'lowers sell_in and quality by 1' do
        item = GeneralItem.new('GENERAL', 10, 10)

        items = [ item ]

        gilded_rose = GildedRose.new(items)

        2.times { gilded_rose.update_quality }

        expect(item.sell_in).to eq(8)
        expect(item.quality).to eq(8)
      end
    end

    context 'when sell by date has passed' do
      it 'lowers quality by 2' do
        item = GeneralItem.new('GENERAL', 0, 10)

        items = [ item ]

        gilded_rose = GildedRose.new(items)

        2.times { gilded_rose.update_quality }

        expect(item.quality).to eq(6)
      end
    end

    it 'The Quality of an item is never negative' do
      item = GeneralItem.new('GENERAL', 0, 0)

      items = [ item ]

      gilded_rose = GildedRose.new(items)

      2.times { gilded_rose.update_quality }

      expect(item.quality).to eq(0)
    end
  end

  describe 'Aged Brie' do
    it 'The Quality of an item is never more than 50' do
      item = AgedBrieItem.new(0, 49)

      items = [ item ]

      gilded_rose = GildedRose.new(items)

      2.times { gilded_rose.update_quality }

      expect(item.quality).to eq(50)
    end

    it 'inceases the quality by 1 before the sell by date' do
      item = AgedBrieItem.new(5, 1)

      items = [ item ]

      gilded_rose = GildedRose.new(items)

      5.times { gilded_rose.update_quality }

      expect(item.quality).to eq(6)
    end

    it 'inceases the quality by 2 after the sell by date' do
      item = AgedBrieItem.new(2, 1)

      items = [ item ]

      gilded_rose = GildedRose.new(items)

      4.times { gilded_rose.update_quality }

      expect(item.quality).to eq(7)
    end
  end

  describe 'Sulfuras' do
    it 'never decreases the sell_in nor the quality' do
      item = SulfurasItem.new(10)

      items = [ item ]

      gilded_rose = GildedRose.new(items)

      5.times { gilded_rose.update_quality }

      expect(item.sell_in).to eq(0)
      expect(item.quality).to eq(10)
    end
  end

  describe 'Backstage passes' do
    context '10+ days before the sell by date' do
      it 'increases the quality by 1' do
        item = BackstagePassesItem.new(11, 0)

        items = [ item ]

        gilded_rose = GildedRose.new(items)

        gilded_rose.update_quality

        expect(item.quality).to eq(1)
      end
    end

    context '10 days or less before the sell by date' do
      it 'increases the quality by 2' do
        item = BackstagePassesItem.new(10, 0)

        items = [ item ]

        gilded_rose = GildedRose.new(items)

        gilded_rose.update_quality

        expect(item.quality).to eq(2)
      end
    end

    context '5 days or less before the sell by date' do
      it 'increases the quality by 3' do
        item = BackstagePassesItem.new(3, 0)

        items = [ item ]

        gilded_rose = GildedRose.new(items)

        gilded_rose.update_quality

        expect(item.quality).to eq(3)
      end
    end

    context 'after the concert' do
      it 'drops the quality to 0' do
        item = BackstagePassesItem.new(0, 10)

        items = [ item ]

        gilded_rose = GildedRose.new(items)

        gilded_rose.update_quality

        expect(item.quality).to eq(0)
      end
    end
  end

  describe 'Conjured items' do
    context 'when sell by date has NOT passed' do
      it 'lowers quality by 2' do
        item = ConjuredItem.new(10, 10)

        items = [ item ]

        gilded_rose = GildedRose.new(items)

        2.times { gilded_rose.update_quality }

        expect(item.quality).to eq(6)
      end
    end

    context 'when sell by date has passed' do
      it 'lowers quality by 4' do
        item = ConjuredItem.new(0, 10)

        items = [ item ]

        gilded_rose = GildedRose.new(items)

        2.times { gilded_rose.update_quality }

        expect(item.quality).to eq(2)
      end
    end
  end
end
