require_relative 'lib/board'
require_relative 'lib/player'
require_relative 'lib/game_state'
require_relative 'art/banners'

class Game
  def initialize
    @board = Board.new(3)
    @player_one = get_player
    @player_two = get_player
    @game_state = GameState.new(@player_one, @player_two, @board)
  end

  def get_player
    puts '','Please input a number to select the players type, 1: Human or 2: Computer',''
    option = gets.chomp.to_i
    unless [1,2].include?(option)
      puts '',"That is not a valid option!",''
      return get_player
    end
    player_name = get_player_name
    player_token = get_player_token
    if option == 1
      player = Human.new(player_name, player_token)
    else
      player = Computer.new(player_name, player_token)
    end 
    player
  end

  def get_player_name
    puts '','Please input the player\'s name',''
    name = gets.chomp
  end

  def get_player_token
    puts '','Please select a token for the player, x or o',''
    token = gets.chomp
    if !['x', 'o'].include?(token)
      puts '',"#{token} is not a valid token!",''
      return get_player_token
    elsif @player_one && @player_one.token == token
      puts '',"#{token} already taken!",''
      return get_player_token
    end
    token
  end

  def play
    @game_state.play
  end
end

if __FILE__ == $0
  Banners.intro_message
  Game.new.play
  Banners.exit_message
end
