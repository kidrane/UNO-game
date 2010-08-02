class Card

  attr_reader :color, :type
  NUMBER = (0..9).to_a
  FUNCTION = [:skip, :reverse, :draw2]
  WILD = [:wild, :wild_draw4]
  COLOR = [:black, :red, :yellow, :blue, :green]
  
  def initialize options
    @type = options[:type]
    @color = options[:color]
  end

  def inspect
    "#{color} #{type}"
  end

  def valid?

    if COLOR.include? @color
      if @color == :black
        WILD.include? @type
      else
        (NUMBER + FUNCTION).include? @type
      end
    else
      false
    end 
  end

  def reverse
    "reverse!" if @type == :reverse
  end
  
  def draw2 
    "draw two!" if @type == :draw2
  end

  def skip
    "skip!" if @type == :skip
  end

  def wild
    "wild!" if @type == :wild
  end

  def wild_draw4
    "wild draw 4" if @type == :wild_draw4
  end

end
