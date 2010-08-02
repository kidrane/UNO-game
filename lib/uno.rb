require "player"
require "deck"

class Uno
  
  INIT_CARDS = 7
  attr_reader :deck
  attr_reader :recycle
  attr_reader :players
  attr_reader :current_color
  attr_reader :current_type

  def initialize
    @recycle = Recycle.new
    @deck = Deck.new @recycle
    @players = Array.new
    @have_to_wild = 0
  end

  def add_player player
    player = Player.new(player, @deck) if player.kind_of?(String)
    return @players << player if player.kind_of?(Player)
    ## should never arrive
  end 
  
  def game_start
    send_out_cards
    fetch_a_starting_card
  end

  def send_out_cards
    @players.each do |player| 
      player.fetch 7
    end
  end

  def fetch_a_starting_card
    card = @deck.fetch
    @current_type = card.type
    @current_color = card.color
    @recycle << card
    return fetch_a_starting_card if @current_color == :black
    card
  end

  def vaild_cards
  end

  def reverse
    @players.reverse!
  end

  def next_player
    @players << current_player
    @current_player = @players.shift
  end
  
  def current_player
    @current_player ||= @players.shift
  end

  def wild
    @have_to_wild += 2
  end

end
