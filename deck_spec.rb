require "deck"

describe Deck do

  before do
    @deck = Deck.new
  end

  it "should contain 108 cards" do
    @deck.count.should == 108
  end

  it "should contain valid cards" do
    @deck.count.times do
      card = @deck.fetch
      card.valid?.should == true
    end
  end

  it "should fetch a card from the top" do
    count = @deck.count
    card = @deck.fetch
    card.class.should == Card
    card.valid?.should == true
    @deck.count.should == (count - 1)
  end

  it "should refresh automatically from the recycle" do
    card = Card.new :type => :skip, :color => :green
    recycle = Recycle.new
    recycle_card_count = 5
    recycle_card_count.times do
      recycle << card
    end
    deck_with_recycle = Deck.new recycle
    count = deck_with_recycle.count
    (count + 1).times do
      deck_with_recycle.fetch
    end
    deck_with_recycle.count.should == recycle_card_count -1
  end
   
end

describe Recycle do
  
  before do
    @recycle = Recycle.new
  end

  it "should collect a card" do
    count = @recycle.count
    card = Card.new :type => :skip, :color => :red
    @recycle << card
    @recycle.count.should == count + 1
  end

end
