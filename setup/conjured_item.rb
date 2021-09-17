require_relative 'regular_item'

class ConjuredItem < RegularItem
    def update            
      decrease_quality_by(2)
      if expired?
        decrease_quality_by(2)
      end            
    end            
end     