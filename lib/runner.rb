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

  puts "Welcome! You're playing with #{deck.count} cards."
  puts "-------------------------------------------------"

  until cardsleftracker == 0
  puts "This is card number #{round.turns.length + 1} out of #{deck.count}."
  puts "Question: #{round.current_card.question}"
  print "> "
  answer = gets.chomp
  currentturn = round.take_turn(answer)
  puts "#{currentturn.feedback}"
  cardsleftracker -= 1
  end

  puts "****** Game over! ******"
  puts "You had #{round.numbercorrect} correct guesses out of #{deck.count} for a total score of #{round.percent_correct.round}%."
  round.category_list.each{|category| puts "#{category} - #{round.percent_correct_by_category(category).round}% correct"}

end
