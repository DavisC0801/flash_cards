require_relative "./card.rb"

class CardGenerator

  attr_reader :cards, :filename

  def initialize(filename = "cards.txt")
    @cards = []
    @filename = filename
  end

  def cardgen
    if File::exists?(@filename)
      File.open(@filename).each do |card|
        newcardinfo = card.split(',')
        #hardcoding this as a properly formatted file will contain these in a set order.
        newcard = Card.new(newcardinfo[0].chomp,newcardinfo[1].chomp,newcardinfo[2].chomp)
        @cards << newcard
      end
    else
      puts "Cannot find cards.txt file, make sure you are running this from where your textfile is!" if !File::exists?(filename)
    end
  end

end
