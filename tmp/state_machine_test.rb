require "state_machine"

class Poker

  state_machine :initial => :pending do
    
    event :play_number_with_same_color do
      transition [:pending, :number, :reverse] => :number
    end
    
    event :play_skip_with_same_color do
      transition [:pending, :number, :reverse] => :skip
    end

    event :play_reverse_with_same_color do
      transition [:pending, :number] => :reverse
    end

    event :play_reverse_after_reverse do
      transition :reverse => same
    end

    event :skip do
      transition :skip => :pending
    end
    
    event :play_draw2_with_same_color do
      transition [:pending, :number, :reverse] => :draw2
    end

    event :play_draw2_after_draw2 do
      transition :draw2 => same
    end

end
    
    
