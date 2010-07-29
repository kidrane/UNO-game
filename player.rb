require "deck"

class Player

  attr_reader :player_name
  attr_reader :cards

  def initialize player_name, deck = Deck.new
    @player_name = player_name
    @deck = deck
    @cards = Array.new
  end
  
  def inspect
    @player_name
  end

  def fetch number = 1
    card = nil
    number.times do
      card = @deck.fetch
      @cards << card
    end
    card
  end

  def count
    @cards.count
  end

  def play index = 0
    @deck.recycle << @cards[index]
    @cards.delete_at index
  end
  
  def pass
  end

  def win?
    count == 0
  end

end
