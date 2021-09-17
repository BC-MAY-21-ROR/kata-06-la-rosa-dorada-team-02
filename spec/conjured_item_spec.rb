require_relative '../setup/conjured_item'
require_relative '../setup/item'
RSpec.describe ConjuredItem do
    context 'Conjured Mana Cake Item' do
        it 'name is Conjured Mana Cake' do
            item = Item.new(name = 'Conjured Mana Cake', sell_in = 2, quality = 5)
            conjured_item = ConjuredItem.new(item)
            name = conjured_item.name
            expect(conjured_item.name).to eq('Conjured Mana Cake')
        end
        
        it 'increase by one when 10' do
            item = Item.new(name = 'Conjured Mana Cake', sell_in = 10, quality = 5)
            conjured_item = ConjuredItem.new(item)
            conjured_item.update
            quality = conjured_item.quality
            expect(quality).to eq(3)
        end
        it 'increase by two when days are minus than 0' do
            item = Item.new(name = 'Conjured Mana Cake', sell_in = -1, quality = 5)
            conjured_item = ConjuredItem.new(item)
            conjured_item.update
            quality = conjured_item.quality
            expect(quality).to eq(1)
        end
    end
end