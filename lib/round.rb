require_relative "./turn.rb"

class Round

  attr_reader :deck, :turns, :guess, :numbercorrect

  def initialize(deck)
    @deck = deck
    @turns = []
    @currentcard = 0
    @numbercorrect = 0
    #using a hash to store category correct, key is category and value is number correct.
    @categorynumbercorrect = Hash.new(0)
  end

  def current_card
    return deck.cards[@currentcard]
  end

  def take_turn(guess)
    yourturn = Turn.new(guess, self.current_card)
    #incriment to next card once turn is taken
    @currentcard += 1
    #if your answer is correct, increase running total of correct answers by 1.
    @numbercorrect += 1 if yourturn.correct?
    #this line makes sure the category of the card is added to the hash, even if you did not answer correctly. Without it the hash will be empty with no correct answers.
    @categorynumbercorrect[yourturn.card.category] = 0 if
    @categorynumbercorrect[yourturn.card.category] < 1
    #incriment the hash key by 1 if you answered correctly.
    @categorynumbercorrect[yourturn.card.category] += 1 if yourturn.correct?
    #add the entire turn object to the turns array
    @turns << yourturn
    return yourturn
  end

  def percent_correct
    #this function returns the number you have gotten correct so far divided by the the length of the turns array after being converted to a float and multiplied by 100. We then round to 1 decimal place to output the correct format.
    return (@numbercorrect / @turns.length.to_f * 100).round(1)
  end

  def number_correct_by_category(category)
    return @categorynumbercorrect[category]
  end

  def category_list
    return @categorynumbercorrect.keys
  end

  def percent_correct_by_category(category)
    #this function takes the category correct hash value for the number correct in a category, then divides by number of cards in that category that have been seen so far. It does so by going through the turns array, creating a subarray using select by category. To get the final result, it then gets the length of that array, converts that to a float and multiplies the result by 100 and rounds it to get the percentage formatting.
    return (@categorynumbercorrect[category] / @turns.select{|turn| category == turn.card.category}.length.to_f * 100).round(1)
  end

end
