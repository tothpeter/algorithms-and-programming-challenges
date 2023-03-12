# frozen_string_literal: true

class ConjuredItem < Item
  NAME = 'Conjured'

  def initialize(sell_in, quality)
    super(NAME, sell_in, quality)
  end

  def update_end_of_day
    self.sell_in -= 1

    if sell_in >= 0
      self.quality -= 2
    else
      self.quality -= 4
    end
  end
end
