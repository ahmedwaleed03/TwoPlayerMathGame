class Turn
  def initialize(player)
    @player = player
  end

  def take_turn
    question = Question.new
    puts "#{player_name}: #{question.text}"
    player_answer = gets.chomp.to_i

    if player_answer == question.answer
      puts "#{player_name}: YES! You are correct."
    else
      @player.lose_life
      puts "#{player_name}: Seriously? No!"
    end
  end

  private

  def player_name
    @player.name
  end
end