require_relative "./card.rb"

class CardGenerator

  attr_reader :cards, :filename

  def initialize(filename = "cards.txt")
    @cards = []
    @filename = filename
  end

  def cardgen
    #this if statement is a guard clause that will give an actionable error message if the file cannot be opened.
    if File.exists?(@filename)
      #this iterator goes through the textfile line by line, and splits each line on the comma into an array. It then passes that new array to create a new card and appends that to the cards array.
      File.open(@filename).each do |card|
        newcardinfo = card.split(',')
        #hardcoding this as a properly formatted file will contain these in a set order.
        newcard = Card.new(newcardinfo[0].chomp,newcardinfo[1].chomp,newcardinfo[2].chomp)
        @cards << newcard
      end
    else
      puts "Cannot find cards.txt file, make sure you are running this from where your textfile is!"
    end
  end

end
