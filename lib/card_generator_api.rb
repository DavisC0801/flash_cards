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
    file = JSON.parse(open("https://opentdb.com/api.php?amount=5&encode=base64").read)
    file["results"].each do |card|
      newcard = Card.new(Base64.decode(card["question"]),Base64.decode64(card["correct_answer"]),Base64.decode64(card["category"]))
      @cards << newcard
    end
  end
end
