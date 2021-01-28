
player_w = 0 
computer_w = 0 

VALID_CHOICES = %w(rock paper scissors spock lizard)

def prompt(message)
  puts "=> #{message}"
end 

def win?(first, second)
  (first == 'rock' && second == 'scissors') || 
  (first == 'paper' && second == 'rock') ||
  (first == 'scissors' && second == 'paper') ||
  (first == 'lizard' && second == 'spock') ||
  (first == 'spock' && second == 'scissors') ||
  (first == 'spock' && second == 'rock') ||
  (first == 'lizard' && second == 'paper') ||
  (first == 'rock' && second == 'lizard') || 
  (first == 'paper' && second == 'spock') || 
  (first == 'scissors' && second == 'lizard')
end 

def display_result(player, computer)
  if win?(player, computer)
    prompt("You won!")
  elsif win?(computer, player)
    prompt("Computer won!")
  else 
    prompt("It's a tie!")
  end 
end 

def update_wins!(player, computer, player_wins, computer_wins)
  if win?(player, computer)
    player_wins += 1 
  elsif win?(computer, player)
    computer_wins += 1 
  end 
end 





loop do
  choice = ''
  loop do 
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    choice = Kernel.gets().chomp()

    if VALID_CHOICES.include?(choice)
      break 
    else
      prompt("That's not a valid choice.")
    end 
  end 

  computer_choice = VALID_CHOICES.sample()

  prompt("You chose: #{choice}; Computer chose: #{computer_choice}")

  display_result(choice, computer_choice)

  update_wins!(choice, computer_choice, player_w, computer_w)

  prompt("Score: player = #{player_w}; computer = #{computer_w}")

  if player_w >= 5
    prompt("Match over: You are the Grand Winner")
    player_w = 0 
    computer_w = 0 
  elsif computer_w >= 5 
    prompt("Match over: Computer is the Grand Winner")
    computer_w = 0 
    player_w = 0
  end 
  
  prompt("Do you want to play again?")
  answer = gets.chomp 
  break unless answer.downcase.start_with?('y')
end 

prompt("Thank you for playing Goodbye!")


