require_relative "./card.rb"
require "open-uri"
require "json"

class CardGeneratorAPI

  attr_reader :cards, :filename

  def initialize(filename = "cards.txt")
    @cards = []
    @filename = filename
    @file
  end

  def cardgen
    file = open("https://opentdb.com/api.php?amount=10").read
    puts file
  end
end
