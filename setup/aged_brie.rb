require_relative 'regular_item'

class AgedBrie < RegularItem
  
  def update              
    increase_quality_by(1)
    increase_quality_by(1) if expired?
  end            
end 