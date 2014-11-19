require_relative 'lib/board'
require_relative 'lib/player'
require_relative 'lib/game_state'
require_relative 'art/banners'
require_relative 'art/images'

COMP_NAMES = ['b0RG', 'd00mB0t', '3X3cut0r', 'G0v3n4t0R', 'Hingle McCringleberry', 'R2D2']

class Game
  def initialize
    @board = Board.new(3)
    @player_one = get_player
    @player_two = get_player
  end

  def get_player
    puts '','Please input a number to select the players type, 1: Human or 2: Computer',''
    option = gets.chomp.to_i

    unless [1,2].include?(option)
      puts '',"That is not a valid option!",''
      return get_player
    end

    if option == 1
      player_name = get_player_name
      player_token = get_player_token
      puts '', "Welcome #{player_name}!", ''
      player = Human.new(player_name, player_token)
    else
      comp_token = @player_one && @player_one.token == 'x' ? 'o' : 'x'
      comp_name = COMP_NAMES.sample
      puts '', "You have been challenged by #{comp_name}! Its token is: #{comp_token}",''
      Art::Images.robot
      player = Computer.new(comp_name, comp_token)
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
      puts '',"#{token} is not a valid token!"
      return get_player_token
    elsif @player_one && @player_one.token == token
      puts '',"#{token} already taken!"
      return get_player_token
    end
    token
  end

  def play
    Art::Banners.game_on
    game_state = GameState.new(@board, @player_one, @player_two)
    game_state.play
  end
end

if __FILE__ == $0
  Art::Banners.intro_message
  Game.new.play
  Art::Banners.exit_message
end
