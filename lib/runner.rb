require_relative './card.rb'
require_relative './deck.rb'
require_relative './round.rb'
require_relative './turn.rb'
require_relative './card_generator_csv.rb'
require_relative './card_generator_yml.rb'

class Runner

  answered = false
  acceptedtypes = ["txt", "csv", "yml", "api"]
  while answered == false
    puts "Which data sorce should be used for card generation?"
    puts "Supported types are txt, csv, yml, or API."
    print "> "
    filetype = gets.chomp
    answered = acceptedtypes.include?(filetype)
  end

  cardcreator = CardGeneratorCSV.new if filetype == "txt" || filetype == "csv"
  cardcreator = CardGeneratorYML.new if filetype == "yml"
  cardcreator.cardgen
  deck = Deck.new(cardcreator.cards)
  round = Round.new(deck)

  cardsleftracker = deck.count
  # including this to have a graceful exit if cards are not created.
  abort("No deck found, you need one to play.") if deck.count == 0

  round.start(deck, round, cardsleftracker)
end
