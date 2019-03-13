class Round
require_relative "./turn.rb"

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
  @numbercorrect += 1 if yourturn.correct? == true
  @categorynumbercorrect[yourturn.card.category]
  @categorynumbercorrect[yourturn.card.category] += 1 if yourturn.correct? == true
  @turns << yourturn
  return yourturn
end

def percent_correct
  return (@numbercorrect / @turns.length.to_f * 100).round(1)
end

def number_correct_by_category(category)
  return @categorynumbercorrect[category]
end

def percent_correct_by_category(category)
  return (@categorynumbercorrect[category] / @turns.select{|turn| category == turn.card.category}.length.to_f * 100).round(1)
end

end
