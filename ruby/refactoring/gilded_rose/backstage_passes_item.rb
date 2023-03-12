# frozen_string_literal: true

class BackstagePassesItem < Item
  NAME = 'Backstage passes to a TAFKAL80ETC concert'

  def initialize(sell_in, quality)
    super(NAME, sell_in, quality)
  end

  def update_end_of_day
    self.sell_in -= 1

    if sell_in < 0
      self.quality = 0
    elsif sell_in <= 2
      self.quality += 3
    elsif sell_in <= 9
      self.quality += 2
    else
      self.quality += 1
    end
  end
end
