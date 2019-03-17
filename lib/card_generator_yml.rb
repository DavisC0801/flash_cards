require_relative "./card.rb"
require "yaml"

class CardGeneratorYML

  attr_reader :cards, :filename

  def initialize(filename = "cards.yml")
    @cards = []
    @filename = filename
    @file
  end

  def cardgen
    #this if statement is a guard clause that will give an actionable error message if the file cannot be opened.
    if !File.exists?(@filename)
    puts "Cannot find cards file, make sure you are running this from where your file is located!"
    #this turns the cardfile variable into a 2d array with questions at element 1, answers at element 2, and categories for element 3.
    else cardfile = YAML.load(File.new(@filename)).values
      cardgentracker = 0
      #this code uses the above tracker variable to iterate over each subarray and create a card using the same index on all three cards at once.
      while cardgentracker < cardfile[0].length
        newcard = Card.new(cardfile[0][cardgentracker], cardfile[1][cardgentracker], cardfile[2][cardgentracker])
        @cards << newcard
        cardgentracker += 1
      end
    end
  end

end
