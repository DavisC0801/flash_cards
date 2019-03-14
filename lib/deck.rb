class Deck

  attr_reader :cards

  def initialize (cards)
    @cards = cards
  end

  def count
    return @cards.length
  end

  def cards_in_category(category)
    #iterator runs through cards array given as an argument and returns a subarray of all objects that have a category that matches the argument.
    return @cards.select {|card| category == card.category}
  end

end
