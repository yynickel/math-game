require './player.rb'
require './question.rb'

Player_1 = Player.new("Player 1")
Player_2 = Player.new("Player 2")
Ques = Question.new()

current_player = Player_1

(1..6).each do
  puts "----- NEW TURN ------"
  puts "#{current_player.name}: #{Ques.generate_question}"
  #check if input is legal
  while true
    begin
      input=Integer(gets.chomp,10)
      raise ArgumentError,'Argument is not an integer' unless input.is_a? Integer
    rescue ArgumentError=>exception_variable
      puts exception_variable
      puts "Please re-enter your answer"
    else
      break
    end
  end

  input===Ques.answer ? (
    puts "#{current_player.name}: YES! You are correct."
  ) : (
    puts "#{current_player.name}: Seriously? No!"
    current_player.score-=1;
  )
  puts "P1: #{Player_1.score}/3 vs P2: #{Player_2.score}/3"
  current_player = current_player===Player_1 ? Player_2 : Player_1
end

Player_1.score===Player_2.score ? (
  puts "Both player scored #{Player_1.score}/3. It is a draw"
) : (
  winner = Player_1.score>Player_2.score ? Player_1 : Player_2
  puts "#{winner.name} wins with a score of #{winner.score}/3"
)

puts "----- GAME OVER -----"
puts "Good bye!"