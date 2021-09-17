require_relative '../setup/backstage_pass'
require_relative '../setup/item'
RSpec.describe BackstagePass do
    context 'Backstage passes to a TAFKAL80ETC concert' do
        it 'name is Backstage passes to a TAFKAL80ETC concert' do
            item = Item.new(name = 'Backstage passes to a TAFKAL80ETC concert', sell_in = 2, quality = 0)
            backstage_pass = BackstagePass.new(item)
            name = backstage_pass.name
            expect(backstage_pass.name).to eq('Backstage passes to a TAFKAL80ETC concert')
        end
        
        it 'increase by one when days are more than 10' do
            item = Item.new(name = 'Backstage passes to a TAFKAL80ETC concert', sell_in = 15, quality = 8)
            backstage_pass = BackstagePass.new(item)
            backstage_pass.update
            quality = backstage_pass.quality
            expect(quality).to eq(9)
        end
        it 'increase by two when days are minus than 10' do
            item = Item.new(name = 'Backstage passes to a TAFKAL80ETC concert', sell_in = 9, quality = 8)
            backstage_pass = BackstagePass.new(item)
            backstage_pass.update
            quality = backstage_pass.quality
            expect(quality).to eq(10)
        end
        it 'increase by two when days are minus than 5' do
            item = Item.new(name = 'Backstage passes to a TAFKAL80ETC concert', sell_in = 4, quality = 8)
            backstage_pass = BackstagePass.new(item)
            backstage_pass.update
            quality = backstage_pass.quality
            expect(quality).to eq(11)
        end
    end
end