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
    abort("No deck found, you need one to play.")
  end

  round.start(deck, round, cardsleftracker)
end
