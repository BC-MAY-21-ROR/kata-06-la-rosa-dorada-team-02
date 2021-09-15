class GildedRose
  SULFURAS = 'Sulfuras, Hand of Ragnaros'
  BACKSTAGE_PASSES = 'Backstage passes to a TAFKAL80ETC concert'
  AGED_BRIE = 'Aged Brie'
  CONJURED = 'Conjured Mana Cake'
  TEN_DAYS = 10
  FIVE_DAYS = 5
  ZERO_DAYS = 0

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
      update_aged_brie_quality(item)
    elsif item.name == BACKSTAGE_PASSES
      update_backstage_passes_quality(item)
    elsif item.name == CONJURED
      expired?(item) ? 2.times { decrease_quality_twice(item) } : decrease_quality_twice(item)
    else
      expired?(item) ? decrease_quality_twice(item) : decrease_quality_for(item)
    end
  end

  def update_aged_brie_quality(item)
    increase_quality_for(item)
    increase_quality_for(item) if expired?(item)
  end

  def update_backstage_passes_quality(item)
    increase_quality_for(item)
    item.sell_in < TEN_DAYS ? increase_quality_for(item) : false
    item.sell_in < FIVE_DAYS ? increase_quality_for(item) : false
    expired?(item) ? item.quality -= item.quality : false
  end

  def expired?(item)
    item.sell_in < ZERO_DAYS
  end

  def update_number_of_days_left_to_sell(item)
    item.sell_in -= 1
  end

  def increase_quality_for(item)
    item.quality += 1 if item.quality < 50
  end

  def decrease_quality_for(item)
    item.quality -= 1 if item.quality > 0
  end

  def decrease_quality_twice(item)
    decrease_quality_for(item)
    decrease_quality_for(item)
  end
end
