class Player
  attr_accessor :name, :token, :value

  def initialize(name, token)
    @name = name
    @token = token
    @value = @token.downcase.eql?('x') ? 1 : -1
  end
end

class Human < Player
  def get_coords
    raw = gets.chomp
    coords = raw.split('')
  end

  def convert_move_to_indicies(string_input)
    string_input.map(&:to_i)
  end

  def valid_move?(coords, board)
    coords.each do |c|
      if c =~ /\D/
        puts "You really expect me to do that #{@name}?"
        return false
      end
    end

    coords = convert_move_to_indicies(coords)
    if coords.empty? || coords.length != 2 || coords.any? {|c| c > (board.width - 1)}
      puts "Tsk tsk #{name}...are you trying to move off the board?"
      return false
    end

    if board.position_available?(coords) == false
      puts "Position is already taken, please try again."
      return false
    end

    true
  end

  def make_human_move(board, game_state)
    puts '',"It's your turn #{@name}!",''
    desired_move = get_coords
    if valid_move?(desired_move, board)
      position = convert_move_to_indicies(desired_move)
      board.set_piece(position, self)
    else
      make_human_move(board, game_state)
      return
    end 
  end
end

class Computer < Player

  def score(game_state)
    if game_state.player_won?(@token)
      return 1
    elsif game_state.player_lost?(@token)
      return -1
    else
      return 0
    end
  end

  def minimax(game_state)
    return score(game_state) if game_state.over?
    scores, moves = [], []
    game_state.board.available_coords.each do |move|
      possible_game = game_state.get_new_state(move)
      scores << minimax(possible_game)
      moves << move
    end

    if game_state.next_player == self
      max_score_index = scores.each_with_index.max[1]
      @choice = moves[max_score_index]
      return scores[max_score_index]
    else
      min_score_index = scores.each_with_index.min[1]
      @choice = moves[min_score_index]
      return scores[min_score_index]
    end
  end

  def make_computer_move(board, game_state)
    puts '',"#{@name} makes a move.",''
    return board.set_piece(board.corners.sample, self) if board.blank?
    return board.set_piece(board.last_position, self) if board.last_position
    minimax(game_state)
    board.set_piece(@choice, self)
  end
end
