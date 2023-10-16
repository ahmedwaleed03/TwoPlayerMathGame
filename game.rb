class Game
  def initialize(player1, player2)
    @players = [player1, player2]
  end

  def play
    puts "Welcome to the 2-Player Math Game!"
    puts "Each player starts with 3 lives."

    while true
      @players.each do |player|
        puts "----- NEW TURN -----"
        turn = Turn.new(player)
        turn.take_turn
        print_scores

        if player.lives == 0
          announce_winner
          return
        end
      end
    end
  end

  def print_scores
    scores = @players.map { |player| "#{player.name}: #{player.lives}/3" }.join(" vs ")
    puts scores
  end

  def announce_winner
    winner = @players.find { |player| player.lives > 0 }
    loser = @players.find { |player| player != winner }

    puts "#{winner.name} wins with a score of #{winner.lives}/3"
    puts "----- GAME OVER -----"
    puts "Good bye!"
  end
end