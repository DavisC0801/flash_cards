require_relative './card.rb'
require_relative './deck.rb'
require_relative './round.rb'
require_relative './turn.rb'

class Runner

card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
card2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
card3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
deck = Deck.new([card1, card2, card3])
round = Round.new(deck)

cardsleftracker = deck.count

puts "Welcome! You're playing with #{deck.count} cards."
puts "-------------------------------------------------"

until cardsleftracker == 0
puts "This is card number #{round.turns.length + 1} out of #{deck.count}."
puts "Question: #{round.current_card.question}."
print "> "
answer = gets.chomp
currentturn = round.take_turn(answer)
puts "#{currentturn.feedback}"
cardsleftracker -= 1
end

puts "****** Game over! ******"
puts "You had #{round.numbercorrect} correct guesses out of #{deck.count} for a total score of #{round.percent_correct}."
#todo 


end
