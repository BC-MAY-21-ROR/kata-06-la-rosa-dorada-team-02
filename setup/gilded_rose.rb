class GildedRose
    SULFURAS = "Sulfuras, Hand of Ragnaros"
    BACKSTAGE_PASSES = "Backstage passes to a TAFKAL80ETC concert"
    AGED_BRIE = "Aged Brie"
    def initialize(items)
        @items = items
    end
    def update_quality
        @items.each do |item|
            next if item.name == SULFURAS
            if (item.name == AGED_BRIE || item.name == BACKSTAGE_PASSES)
                increase_quality_for(item)
                if item.name == BACKSTAGE_PASSES
                    if item.sell_in < 11
                        increase_quality_for(item)
                    end
                    if item.sell_in < 6
                        increase_quality_for(item)
                    end
                end
            else
                decrease_quality_for(item)
            end
            item.sell_in -= 1
            if item.sell_in < 0
                if item.name == AGED_BRIE
                    increase_quality_for(item)
                elsif item.name == BACKSTAGE_PASSES
                    item.quality -= item.quality
                else
                    decrease_quality_for(item)
                end
            end
        end
    end
    def increase_quality_for(item)
        if item.quality < 50
            item.quality += 1
        end            
    end  
    def decrease_quality_for(item)
        if item.quality > 0
            item.quality -= 1
        end 
    end
end