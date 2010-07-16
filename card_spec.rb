require "card"

describe Card do
  
  it "应该能设置花色和牌的类别" do
    card = Card.new :color => :black, :type => :plus2
    card.color.should == :black
    card.type.should == :plus2
  end

end
