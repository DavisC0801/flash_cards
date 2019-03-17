require_relative "./card.rb"
require "yaml"

#httparty

class CardGeneratorCSV

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
    elsif File.extname(@filename) == ".txt" || File.extname(@filename) == ".csv"
      #this iterator goes through the textfile line by line, and splits each line on the comma into an array. It then passes that new array to create a new card and appends that to the cards array.
      File.open(@filename).each do |card|
        newcardinfo = card.split(',')
        #hardcoding this as a properly formatted file will contain these in a set order.
        newcard = Card.new(newcardinfo[0].chomp,newcardinfo[1].chomp,newcardinfo[2].chomp)
        @cards << newcard
      end
    else File.extname(@filename) == ".yml"
      #this turns the cardfile variable into a 2d array with questions at element 1, answers at element 2, and categories for element 3.
      cardfile = YAML.load(File.new(@filename)).values
      cardgentracker = 0
      while cardgentracker < cardfile[0].length
        newcard = Card.new(cardfile[0][cardgentracker], cardfile[1][cardgentracker], cardfile[2][cardgentracker])
        @cards << newcard
        cardgentracker += 1
      end
    end
  end

end
