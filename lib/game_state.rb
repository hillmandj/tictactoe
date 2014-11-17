class GameState
  attr_accessor :player_one, :player_two, :next_player, :last_player, :winner, :board

  def initialize(player_one, player_two, board)
    @player_one = player_one 
    @player_two = player_two
    @next_player = @player_one
    @last_player = @player_two
    @value_to_token = value_to_token_hash
    @board = board 
    @winner = nil
  end

  def players
    [@player_one, @player_two]
  end

  def value_to_token_hash
    Hash[players.collect{|player| [player.value, player.token]}]    
  end

  def display_player(value)
    @value_to_token[value]
  end

  def switch_players
    @next_player, @last_player = @last_player, @next_player
  end

  def get_next_move(player)
    if player.is_a?(Human)
      player.make_human_move(@board, self)
    end

    if player.is_a?(Computer)
      player.make_computer_move(@board, self)
    end
    switch_players
  end

  def get_new_state(coords)
    new_state = dup
    new_state.player_one = @player_one.dup
    new_state.player_two = @player_two.dup
    new_state.board = Marshal.load(Marshal.dump(@board))
    new_state.check_win
    new_state.board.set_piece(coords, new_state.next_player)
    new_state.switch_players
    new_state
  end

  def display_game
    puts
    @board.board.each_with_index do |row, idx|
      puts row.map{|i| i !=0 ? display_player(i) : ' '}.join(' | ')
      if idx < (@board.width - 1)
        puts '--+---+--'
      end
    end
    puts
  end

  def horizontal_win?
    @board.rows.map(&:abs).include?(@board.width)
  end

  def vertical_win?
    @board.columns.map(&:abs).include?(@board.width)
  end

  def diagonal_win?
    @board.diagonal_one.abs.eql?(@board.width) || @board.diagonal_two.abs.eql?(@board.width)
  end

  def player_won?(token)
    return @winner.token == token if @winner
    false
  end

  def player_lost?(token)
    return @winner.token != token if @winner
    false
  end

  def win?
    (horizontal_win? || vertical_win? || diagonal_win?)
  end

  def draw?
    @board.full? && @winner.nil?
  end

  def over?
    @winner || draw?
  end

  def check_win
    if win?
      @winner = @last_player
    end
    @winner
  end

  def play
    display_game
    until over?
      get_next_move(@next_player)
      check_win
      display_game
    end

    if win?
      puts "#{@winner.name} wins!"
    end

    if draw?
      puts 'Aww shucks...game is a draw!'
    end
  end
end
