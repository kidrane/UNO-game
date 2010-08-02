require "card"

class Deck
  attr_reader :recycle

  def initialize recycle = Recycle.new
    @recycle = recycle
    @cards = Array.new
    2.times do
      (Card::NUMBER + Card::FUNCTION).each do |type|
        (Card::COLOR).each do |color|
          card = Card.new :type => type, :color => color 
          @cards << card unless color == :black
        end
      end
      (Card::WILD).each do |type|
        @cards << (Card.new :type => type, :color => :black)
      end
    end
  end
  
  def count
    @cards.count
  end

  def fetch
    refresh if count == 0
    @cards.shift
  end

  def refresh
    @cards += @recycle
    @recycle.clear
    shuffle
  end

  def shuffle
    count.downto(1).each do |i|
      j = rand i
      tmp = @cards[i-1]
      @cards[i-1] = @cards[j]
      @cards[j] = tmp
    end
  end

end

class Recycle < Array

end
