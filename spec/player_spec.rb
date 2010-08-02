require "player"
require "deck"

describe Player do

  before do
    @player_name = "Test Player"
    @deck = Deck.new
    @player = Player.new @player_name, @deck
  end

  it "should show his/her name" do
    @player.inspect.should == @player_name
  end

  it "should fetch a card from a deck" do
    deck_count = @deck.count
    player_count = @player.cards.count
    @player.fetch
    @deck.count.should == (deck_count - 1)
    @player.cards.count.should == (player_count + 1)
    @player.cards.first.kind_of?(Card).should == true
  end

  it "should show all the cards holding" do
    @player.cards.each do |card|
      card.kind_of?(Card).should == true
    end
  end

  it "should play a card" do
    @player.fetch
    player_count = @player.cards.count
    recycle = @deck.recycle
    recycle_count = recycle.count
    played_card = @player.play(rand(player_count))
    played_card.kind_of?(Card).should == true
    @player.count.should == (player_count - 1)
    recycle.count.should == (recycle_count + 1)
    recycle.last.should == played_card
  end
  
  it "could pass a turn" do
    @player.pass
  end

  it "should win when having no cards in hands" do
    @player.fetch
    @player.win?.should == false
    @player.cards.count.times do
      @player.play
    end
    @player.win?.should == true
  end

end
