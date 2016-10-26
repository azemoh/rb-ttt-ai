class Game
  include Concerns::Winable
  attr_accessor :player_1, :player_2

  def initialize(player_1 = Human.new("X"), player_2 = Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def current_player
    board.turn_count.even? ? player_1 : player_2
  end

  def winner
    if won = won?
      board.cells[won.first]
    end
  end

  def turn
    cell = current_player.move(board)

    if !board.valid_move?(cell)
      puts "Wrong move buddy!"
      turn
    else
      board.update(cell, current_player)
      board.display
    end
  end

  def play
    board.display

    until over?
      turn
    end

    puts won? ? "Congratulations #{winner}!" :  "Cats Game!"
  end

end
