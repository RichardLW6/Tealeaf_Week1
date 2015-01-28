# BLACKJACK V.1

# 1. A deck is created.

# 2. The deck is shuffled.

# 3. Player1 and Dealer are dealt 2 cards
  # => Computer only shows 1 card
  # => Player can see both cards

# 4. Value of both hands is calculated

# 5. If Player1 gets blackjack, player automatically wins
      # GAME END

# 6. Player can choose to HIT or STAND

# 7. If HIT, Player gets another card and it is calculated

# 8. If Player goes above 21, the Player BUSTS and the Dealer wins
      # GAME END
  # => BUT - if Player has ACE, that ACE value then turns from 11 to 1

# 9. If Player stands, does not have BLACKJACK, and does not BUST...Computer turn begins

# 10. Computer flips other card and shows it to player
  # => If the cards show BLACKJACK, Computer wins
        # GAME END

# 11. Computer flips cards until...
  # => Computer is above Player && NOT BUSTING - WINS
        # GAME END
  # => Computer is equal to Player && above 18 - PUSH (Tie)
        # GAME END
  # => Computer BUSTS and has not Ace - LOSE
        # GAME END
        # OR...if Computer has ACE, that ACE turns from 11 to 1
  # => Computer is above 18 but BELOW PLAYER - LOSE
        # GAME END

# 12. GAME END - WINNER Announced. OR...TIE announced.

# 13. END OR CONTINUE?  Give the user Choice to play again.





#### CREATE HAND WITH VALUES, PREPARING TO TOTAL VALUES

# def total_hand_value(hand)

#   array = []
#   hand.each_value { |v| array.push(v) }
#   array.inject(0) { |result, element| result + element }

# end


#### ASSIGN VALUES TO HANDS

# def assign_card_values(hand)

#    Hash[hand.collect do |v|

#     if v.include?("Ace")
#       [v, 11] 
#     elsif v.include?("K") || v.include?("Q") || v.include?("J")
#       [v, 10]
#     else
#       [v, v.to_i]
#     end
#    end]


# end

def hand_values(hand)

  value_hand = hand.map do |x|
    if x.include?("Ace")
      x = 11
    elsif x.include?("K") || x.include?("Q") || x.include?("J") || x.include?("1")
      x = 10
    else
      x = x[0].to_i
    end
  end

  value_hand.inject(0) { |result, element| result + element }
end



#### STATING THE PLAYER HAND VALUE

def say_player_hand_value(hand, hand_value)

  puts "Your hand is #{hand} which comes to a total value of #{hand_value}"

end


#### STATING THE COMPUTER STARTING HAND


def say_dealer_hand_value(hand, hand_value)

  puts "The computer is showing a #{hand} which comes to a total value of #{hand_value}"

end


#### ADJUSTING FOR ACES

def player_hit(hand, deck)

  hand = hand.push(deck.pop)

end




#### CREATE THE DECK

face_cards = ["Ace_", "King_", "Queen_", "Jack_", "10_", "9_", "8_", "7_", "6_", "5_", "4_", "3_", "2_"]

suits = ["Spades", "Hearts", "Clubs", "Diamonds"]

cards = []

face_cards.each do |x|
  suits.each do |y|
    cards.push(x + y)
  end
end

#### SHUFFLE THE CARDS

cards.shuffle!


#### DEAL HANDS

player_hand = 2.times.collect{cards.pop}

dealer_hand = 1.times.collect{cards.pop}


#### ASSIGN VALUES TO SHUFFLED CARDS

dealer_hand_value = hand_values(dealer_hand)

player_hand_value = hand_values(player_hand)


#### STATE THE INITIAL HANDS OF BOTH PLAYERS

say_dealer_hand_value(dealer_hand, dealer_hand_value)

say_player_hand_value(player_hand, player_hand_value)

if player_hand_value == 21
  puts "Congratulations, you have a blackjack and are the winner!"
end

#### GIVE OPTION TO PLAYER TO HIT OR STAND
begin
  puts "Would you like to HIT or STAND?"
  player_decision = gets.chomp.upcase
end until player_decision == "HIT" || player_decision == "STAND"








# cards_with_values_ready = Hash[cards.collect do |v| 

#   if v.include?("Ace")
#   [v, 11] 
#   elsif v.include?("K") || v.include?("Q") || v.include?("J")
#   [v, 10]
#   else
#   [v, v.to_i]
#   end
# end]









