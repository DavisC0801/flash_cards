class Turn

  attr_reader :guess, :card

  def initialize(guess, card)
    @guess = guess
    @card = card
  end

  def correct?
    #downcase is to remove case sensitivity in answers
    return @guess.downcase == card.answer.downcase
  end

  def feedback
    return "Correct!" if correct?
    return "Incorrect."
  end

end
