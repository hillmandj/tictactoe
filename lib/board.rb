class Board
  attr_accessor :width, :board, :rows, :columns, :diagonal_one, :diagonal_two, :corners, :available_coords

  def initialize(width)
    @width = width
    @blanks = width ** 2
    @occupied = 0
    @rows, @columns = Array.new(width - 1) { Array.new(width, 0) }
    @diagonal_one, @diagonal_two = 0, 0
    @corners = [0, width - 1].product([0, width - 1])
    @available_coords = set_available_coords(width)
    @board = Array.new(width) { Array.new(width, 0) }
  end

  def blank?
    @blanks == @width ** 2
  end

  def full?
    @occupied == @width ** 2
  end

  def value_at(coords)
    @board[coords.first][coords.last]
  end

  def position_available?(coords)
    value_at(coords) == 0
  end

  def last_position
    @available_coords.last if @available_coords.length == 1
  end

  def add_to_totals(coords, player_value)
    @rows[coords.first] += player_value
    @columns[coords.last] += player_value
    @diagonal_one = (0...@width).collect{|i| @board[i][i]}.inject(:+)
    @diagonal_two = (0...@width).collect{|i| @board[(@width - 1) - i][i]}.inject(:+)
  end

  def set_piece(coords, player)
    @board[coords.first][coords.last] = player.value
    @blanks -= 1
    @occupied += 1
    @available_coords.delete(coords)
    add_to_totals(coords, player.value)
  end

  def set_available_coords(width)
    width.times.to_a.product(width.times.to_a)
  end
end
