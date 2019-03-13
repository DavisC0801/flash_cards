class Turn

attr_reader :guess, :card

def initialize(guess, card)
  @guess = guess
  @card = card
end

def correct?
  return @guess == card.answer
end

def feedback
  return "Correct!" if correct?
  return "Incorrect."
end

end
