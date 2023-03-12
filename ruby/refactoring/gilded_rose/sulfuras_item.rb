# frozen_string_literal: true

class SulfurasItem < Item
  NAME = 'Sulfuras, Hand of Ragnaros'

  def initialize(quality)
    super(NAME, 0, quality)
  end

  def update_end_of_day
  end
end
