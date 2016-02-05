class TicTacToeCli

  attr_accessor :game

  def initialize
    @game = Game.new
  end

  def call
    puts "**** Welcome to Tic Tac Toe! ****\n\n"
    help

    loop do
      puts "\nWhat mode do you want to play?"

      case gets.strip
      when "1"
        zero_player
      when "2"
        one_player
      when "3"
        two_players
      when "help"
        help
      when "exit"
        break
      else
        puts "Invalid! type 'help' for help.\n\n"
      end
    end
  end

  def help
    puts "1: 0 Player mode (Com vs Com).\n2: 1 Player mode (Human vs Com).\n3: 2 Players mode (Human vs Human).\nhelp: to display this menu.\nexit: to quit.\n"
  end


  def zero_player
    game.board.reset!
    puts "---- Com X vs Com O ----\n\n"

    game.player_1 = Computer.new("X")
    game.player_2 = Computer.new("O")

    game.play
  end

  # Game between a Human and Computer
  def one_player
    game.board.reset!
    print "You won't beat me, but you can try :P\nWould you like to go first? (y/n): "
    input = gets.strip

    if ["y", "yes"].include?(input.downcase)
      puts "---- Human X vs Com O ----\n\n"
      game.player_1 = Human.new("X")
      game.player_2 = Computer.new("O")
    elsif ["n", "no"].include?(input.downcase)
      puts "---- Com X vs Human O ----\n\n"
      game.player_1 = Computer.new("X")
      game.player_2 = Human.new("O")
    else
      puts "Invalid input, quiting..."
      return
    end

    game.play
  end

  # Game between two Humans
  def two_players
    game.board.reset!
    puts "---- Human X vs Human O ----\n\n"

    game.player_1 = Human.new("X")
    game.player_2 = Human.new("O")

    game.play
  end

end