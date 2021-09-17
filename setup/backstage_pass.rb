require_relative 'regular_item'

class BackstagePass < RegularItem
    def update           
      return @item.quality = ZERO_DAYS if expired?    

      increase_quality_by(1)
      increase_quality_by(1) if @item.sell_in < FIVE_DAYS
      increase_quality_by(1) if @item.sell_in < TEN_DAYS
    end       
end       