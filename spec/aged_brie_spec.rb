require_relative '../setup/aged_brie'
require_relative '../setup/item'
RSpec.describe AgedBrie do
    context 'Aged Brie Item' do
        it 'name is Aged Brie' do
            item = Item.new(name = 'Aged Brie', sell_in = 2, quality = 0)
            aged_brie = AgedBrie.new(item)
            name = aged_brie.name
            expect(aged_brie.name).to eq('Aged Brie')
        end
        
        it 'increase by one when 10' do
            item = Item.new(name = 'Aged Brie', sell_in = 10, quality = 5)
            aged_brie = AgedBrie.new(item)
            aged_brie.update
            quality = aged_brie.quality
            expect(quality).to eq(6)
        end
        it 'increase by two when days are minus than 0' do
            item = Item.new(name = 'Aged Brie', sell_in = -1, quality = 5)
            aged_brie = AgedBrie.new(item)
            aged_brie.update
            quality = aged_brie.quality
            expect(quality).to eq(7)
        end
    end
end