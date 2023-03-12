# frozen_string_literal: true

class GildedRose
  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each do |item|
      item.update_end_of_day

      item.quality = 50 if item.quality > 50
      item.quality = 0 if item.quality < 0
    end
  end
end
