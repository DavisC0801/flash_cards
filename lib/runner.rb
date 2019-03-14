require_relative './card.rb'
require_relative './deck.rb'
require_relative './round.rb'
require_relative './turn.rb'
require_relative './card_generator.rb'

class Runner
  cardcreator = CardGenerator.new
  cardcreator.cardgen
  deck = Deck.new(cardcreator.cards)
  round = Round.new(deck)

  cardsleftracker = deck.count
  # including this to have a graceful exit if cards are not created.
  if deck.count == 0
    puts "No deck found, you need one to play."
    exit
  end

  #print intro statement.
  puts "Welcome! You're playing with #{deck.count} cards."
  puts "-------------------------------------------------"

  #core gameplay loop, we set the tracker variable to the amount of cards in the deck and decrement by 1 every pass.
  until cardsleftracker == 0
  puts "This is card number #{round.turns.length + 1} out of #{deck.count}."
  puts "Question: #{round.current_card.question}"
  print "> "
  answer = gets.chomp
  #calls the round.take_turn method and uses logic in that method for feedback.
  currentturn = round.take_turn(answer)
  #prints feedback from the turn object, which is returned by the take turn method.
  puts "#{currentturn.feedback}"
  cardsleftracker -= 1
  end

  puts "****** Game over! ******"
  puts "You had #{round.numbercorrect} correct guesses out of #{deck.count} for a total score of #{round.percent_correct.round}%."
  #created a helper method in the round class that returns all categories on the cards in an array. This line iterates through that array and puts the category name, then a dash, and the percentage correct by calling the percent correct by category method from the round class.
  round.category_list.each{|category| puts "#{category} - #{round.percent_correct_by_category(category).round}% correct"}

end
