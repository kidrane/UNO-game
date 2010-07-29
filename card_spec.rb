require "card"

describe Card do

  before do
    @card = Card.new :color => :black, :type => :wild
  end
  
  it "应该能设置花色和牌的类别" do
    @card.color.should == :black
    @card.type.should == :wild
  end

  it "应该显示自己的花色和类别" do
    @card.inspect.should == "black wild"
  end

  it "应该判别牌的合法性" do
    valid_card = Card.new :color => :red, :type => 9
    invalid_card = Card.new :color => :white, type => :ten
    valid_card.valid?.should == true
    invalid_card.valid?.should == false
  end

end
