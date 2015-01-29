# BLACKJACK V.1


#### CREATING THE DECK

def create_deck
  face_cards = ["Ace_", "King_", "Queen_", "Jack_", "10_", "9_", "8_", "7_", "6_", "5_", "4_", "3_", "2_"]
  suits = ["Spades", "Hearts", "Clubs", "Diamonds"]
  deck = []
  face_cards.each do |x|
    suits.each do |y|
      deck.push(x + y)
    end
  end
  deck
end

#### ADJUSTING HAND VALUE BASED ON HAVING ACES

def adjust_value_for_aces(hand, value)
  aces = [] 
  hand.each do |x|
    if x[0..2] == "Ace"
      aces.push(x)
    end
  end
  ace_count = aces.length
  if ace_count != 0 && value > 21
    begin
      value -= 10
      ace_count -= 1
    end until value <= 21 || ace_count == 0
  end
  value
end

#### CALCULATING OVERALL HAND VALUE

def determine_hand_value(hand)
  value_hand = hand.map do |x|
    if x.include?("Ace")
      x = 11
    elsif x.include?("K") || x.include?("Q") || x.include?("J") || x.include?("1")
      x = 10
    else
      x = x[0].to_i
    end
  end
  value_hand = value_hand.inject(0) { |result, element| result + element }
  adjust_value_for_aces(hand, value_hand)
end

#### STATING THE PLAYER HAND VALUE

def say_player_hand_value(hand)
  puts "Your hand is #{hand} which comes to a total value of " + (determine_hand_value(hand)).to_s
end

#### STATING THE COMPUTER HAND VALUE

def say_dealer_hand_value(hand)
  puts "The computer is showing a #{hand} which comes to a total of " + (determine_hand_value(hand)).to_s
end

#### ADDING ANOTHER CARD TO A HAND (HITTING)
def hit(hand, deck)
  hand.push(deck.pop)
end

#### DETERMINING THE WINNING HAND
def determine_winning_hand(dealer, player)
  if dealer > 21
    puts "The dealer busts with a hand total of #{dealer}. You win!"
  elsif dealer > player
    puts "The dealer, with a hand total of #{dealer}, beats your hand total of #{player}. Dealer wins!"
  elsif player > dealer
    puts "Your hand total of #{player} beats the dealer's hand total of #{dealer}.  You win!"
  else
    puts "Both of your hands total #{player}.  It's a push!"
  end
end



#### STARTS OFF THE GAME

begin
  cards = create_deck

  #### SHUFFLE THE CARDS
  
  cards.shuffle!

  #### DEAL HANDS

  player_hand = 2.times.collect{cards.pop}
  dealer_hand = 1.times.collect{cards.pop}

  player_values = determine_hand_value(player_hand)
  dealer_values = determine_hand_value(dealer_hand)

  #### STATE THE INITIAL HANDS OF BOTH PLAYERS

  say_dealer_hand_value(dealer_hand)
  say_player_hand_value(player_hand)

  #### CHECK FOR PLAYER BLACKJACK

  player_blackjack = false
  dealer_blackjack = false

  if determine_hand_value(player_hand) == 21
    puts "Congratulations, you have a blackjack and are the winner!"
    player_blackjack = true
  end

  #### PLAYER TURN

  if player_blackjack == false
    while true
      puts "Would you like to HIT or STAND?"
      player_decision = gets.chomp.upcase
      if player_decision == "HIT"
        hit(player_hand, cards)
        player_values = determine_hand_value(player_hand)
        if player_values > 21 
          say_player_determine_hand_value(player_hand)
          puts "Sorry, you busted, and you're a loser!"
          break
        end
        say_player_determine_hand_value(player_hand)
      elsif player_decision == "STAND"
        break
      else 
        puts "Give a real answer please."
      end
    end 
  end

  #### DEALER TURN

  if player_blackjack == false && player_values <= 21
    begin
      puts "The dealer flips another card."
      hit(dealer_hand, cards)
      dealer_values = determine_hand_value(dealer_hand)
      say_dealer_hand_value(dealer_hand)
    end until dealer_values >= 17 || dealer_values > player_values
    determine_winning_hand(dealer_values, player_values)
  end

  #### ASK PLAYER TO CONTINUE OR STOP PLAYING

  begin
    puts "Would you like to play again? Y/N"
    continue_answer = gets.chomp.upcase
  end until continue_answer == "Y" || continue_answer == "N"

end until continue_answer == "N"



