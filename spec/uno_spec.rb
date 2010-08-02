require "uno"

describe Uno do
  
  before do
    @uno = Uno.new
    
  end

  it "should initialze deck and recycle" do
    @uno.deck.class.should == Deck
    @uno.recycle.class.should == Recycle
  end

  it "should add a player" do
    @uno.add_player "Test Player 1"
    @uno.players.first.inspect.should == "Test Player 1"
  end

  it "should give every player 7 cards after starting" do
    @uno.game_start
    @uno.players.each do |player|
      player.count.should == Uno::INIT_CARDS
    end
  end

  it "should never have a black starting card" do
    @uno.fetch_a_starting_card
    # @uno.current_type.should != :wild
    # @uno.current_type.should != :wild_draw4
    # @uno.current_color.should != :black
  end

  it "should get current player" do
    @uno.add_player "Player One"
    @uno.add_player "Player Two"
    @uno.current_player.should == @uno.players.first
  end

  it "should list valid actions" do
  end

  it "should play a card" do
  end
  
  it "should fetch a card" do
  end

  it "should pass to the next player" do
  end

  it "should make the next player draw 2 cards" do
  end

  it "should change the color when using wild2" do
  end

  it "should change the color and make the next player draw 4 cards when using wild_draw4" do
  end

end
