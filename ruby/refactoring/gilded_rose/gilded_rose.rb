# frozen_string_literal: true

class GildedRose
  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each do |item|
      next if item.name == 'Sulfuras, Hand of Ragnaros'

      item.sell_in -= 1

      case item.name
      when 'Aged Brie'
        update_aged_brie_item(item)
      when 'Backstage passes to a TAFKAL80ETC concert'
        update_backstage_passes_item(item)
      when 'Conjured'
        update_conjured_item(item)
      else
        update_general_item(item)
      end

      item.quality = 50 if item.quality > 50
      item.quality = 0 if item.quality < 0
    end
  end

  private

  def update_aged_brie_item(item)
    if item.sell_in >= 0
      item.quality += 1
    else
      item.quality += 2
    end
  end

  def update_backstage_passes_item(item)
    if item.sell_in < 0
      item.quality = 0
    elsif item.sell_in <= 2
      item.quality += 3
    elsif item.sell_in <= 9
      item.quality += 2
    else
      item.quality += 1
    end
  end

  def update_conjured_item(item)
    if item.sell_in >= 0
      item.quality -= 2
    else
      item.quality -= 4
    end
  end

  def update_general_item(item)
    if item.sell_in >= 0
      item.quality -= 1
    else
      item.quality -= 2
    end
  end
end
