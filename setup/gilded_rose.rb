require_relative 'aged_brie'
require_relative 'backstage_pass'
require_relative 'conjured_item'
require_relative 'regular_item'

class GildedRose
  SULFURAS = 'Sulfuras, Hand of Ragnaros'
  BACKSTAGE_PASSES = 'Backstage passes to a TAFKAL80ETC concert'
  AGED_BRIE = 'Aged Brie'
  CONJURED = 'Conjured Mana Cake'
  attr_reader :items
  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each do |item|
      next if item.name == SULFURAS
      update_number_of_days_left_to_sell(item)
      update_quality_for(item)
    end
  end

  def update_quality_for(item)
    if item.name == AGED_BRIE
      aged_brie = AgedBrie.new(item)
      aged_brie.update
    elsif item.name == BACKSTAGE_PASSES
      backstage = BackstagePass.new(item)
      backstage.update
    elsif item.name == CONJURED
      conjured = ConjuredItem.new(item)
      conjured.update
    else
      regular = RegularItem.new(item)
      regular.update
    end
  end

  def update_number_of_days_left_to_sell(item)
    item.sell_in -= 1
  end

end
