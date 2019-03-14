  require_relative "./turn.rb"

class Round
  
  attr_reader :deck, :turns, :guess, :numbercorrect

  def initialize(deck)
    @deck = deck
    @turns = []
    @currentcard = 0
    @numbercorrect = 0
    @categorynumbercorrect = Hash.new(0)
  end

  def current_card
    return deck.cards[@currentcard]
  end

  def take_turn(guess)
    yourturn = Turn.new(guess, self.current_card)
    @currentcard += 1
    @numbercorrect += 1 if yourturn.correct?
    @categorynumbercorrect[yourturn.card.category] = 0 if @categorynumbercorrect[yourturn.card.category] < 1
    @categorynumbercorrect[yourturn.card.category] += 1 if yourturn.correct?
    @turns << yourturn
    return yourturn
  end

  def percent_correct
    return (@numbercorrect / @turns.length.to_f * 100).round(1)
  end

  def number_correct_by_category(category)
    return @categorynumbercorrect[category]
  end

  def category_list
    return @categorynumbercorrect.keys
  end

  def percent_correct_by_category(category)
    #so this is a long statement, longer then I would like to make. As a breakdown, we have the category correct hash number correct, divided by number of cards in that category that have been seen so far. This goes through the turns array, creates a subarray using select going by category, and then gets the length of that array, converts that to a float and multiplies the result by 100 and rounds it to get the percentage formatting. I know that this is normally done at end of game, but if you hardcoded this to just divide by the total correct from the category then the percentage is incorrect partway through the game when those cards haven't been shown to the player yet.
    return (@categorynumbercorrect[category] / @turns.select{|turn| category == turn.card.category}.length.to_f * 100).round(1)
  end

end
