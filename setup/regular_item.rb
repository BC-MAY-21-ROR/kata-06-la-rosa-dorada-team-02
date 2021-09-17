require_relative 'item'

class RegularItem    
    ZERO_DAYS = 0
    TEN_DAYS  = 10
    FIVE_DAYS = 5
    attr_reader :name, :quality
    def initialize(item)
      @item = item
    end
    def name
      @item.name
    end
    def quality
      @item.quality
    end
    def update 
      return decrease_quality_by(1) unless !expired?
      decrease_quality_by(2)
    end

    def expired?     
      @item.sell_in < ZERO_DAYS
    end

    def increase_quality_by(increment)
      @item.quality += increment
      enforce_quality_of_an_item_is_not_more_than(50)
    end

    def decrease_quality_by(decrement)
      @item.quality -= decrement
      enforce_quality_of_an_item_is_never_negative
    end
    def enforce_quality_of_an_item_is_never_negative
      @item.quality = 0 if @item.quality < 0
    end

    def enforce_quality_of_an_item_is_not_more_than(limit)
      @item.quality = limit if @item.quality > limit
    end
end          