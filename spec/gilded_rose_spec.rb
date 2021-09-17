require_relative '../setup/gilded_rose'
require_relative '../setup/item'
RSpec.describe GildedRose do
    before :each do 
        @items =  [
            Item.new(name = '+5 Dexterity Vest', sell_in = 10, quality = 20),
            Item.new(name = 'Aged Brie', sell_in = 2, quality = 0),
            Item.new(name = 'Elixir of the Mongoose', sell_in = 5, quality = 7),
            Item.new(name = 'Sulfuras, Hand of Ragnaros', sell_in = 0, quality = 80),
            Item.new(name = 'Sulfuras, Hand of Ragnaros', sell_in = -1, quality = 80),
            Item.new(name = 'Backstage passes to a TAFKAL80ETC concert', sell_in = 15, quality = 20),
            Item.new(name = 'Backstage passes to a TAFKAL80ETC concert', sell_in = 10, quality = 49),
            Item.new(name = 'Backstage passes to a TAFKAL80ETC concert', sell_in = 5, quality = 49),
            Item.new(name = 'Conjured Mana Cake', sell_in = 3, quality = 6)
        ]
        @gilded_rose = GildedRose.new(@items)
    end

    context 'Aged Brie Item' do 
        
        it 'name is Aged Brie' do
          items = @gilded_rose.items
          name = items[1].name
          expect(name).to eq('Aged Brie')
        end
        
        context 'Quality Item' do 
        
            it 'first day quality is 0' do
              items = @gilded_rose.items
              quality = items[1].quality
              expect(quality).to eq(0)
            end
        
            it 'after one day the quality is 1' do
              @gilded_rose.update_quality
              items = @gilded_rose.items
              quality = items[1].quality
              expect(quality).to eq(1)
            end
        
            it 'after two days the quality is 2' do
              2.times { @gilded_rose.update_quality }
              items = @gilded_rose.items
              quality = items[1].quality
              expect(quality).to eq(2)
            end
        
            it 'after three days the quality is 4' do
              3.times { @gilded_rose.update_quality }
              items = @gilded_rose.items
              quality = items[1].quality
              expect(quality).to eq(4)
            end
        
            it 'after four days the quality is 6' do
              4.times { @gilded_rose.update_quality }
              items = @gilded_rose.items
              quality = items[1].quality
              expect(quality).to eq(6)
            end
        
            it 'after five days the quality is 8' do
              5.times { @gilded_rose.update_quality }
              items = @gilded_rose.items
              quality = items[1].quality
              expect(quality).to eq(8)
            end
        end   
    end
end