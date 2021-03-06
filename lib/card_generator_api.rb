require_relative "./card.rb"
require "open-uri"
require "json"
require "base64"

class CardGeneratorAPI

  attr_reader :cards

  def initialize
    @cards = []
  end

  def cardgen
    file = JSON.parse(open("https://opentdb.com/api.php?amount=5&type=boolean&encode=base64").read)
    #the output of the api is a hash containing an array of however many cards were requested, in our case 5. This iterates through that array and creates a card based on the question, answer and category key. A call to base64 decode changes the request from the api to plaintext.
    file["results"].each do |card|
      newcard = Card.new(Base64.decode64(card["question"]),Base64.decode64(card["correct_answer"]),Base64.decode64(card["category"]))
      @cards << newcard
    end
  end
end
