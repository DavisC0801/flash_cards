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
    #this line is here to initialize the category hash on an incorrect answer.
    @categorynumbercorrect[yourturn.card.category] = @categorynumbercorrect[yourturn.card.category]
    #add the entire turn object to the turns array
    @turns << yourturn
    correctanswer if yourturn.correct?
    return yourturn
  end

  def correctanswer
    #if your answer is correct, increase running total of correct answers by 1.
    @numbercorrect += 1
    #incriment the hash key by 1 if you answered correctly.
    @categorynumbercorrect[@turns.last.card.category] += 1
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

  def start(deck, round, cardsleftracker)
    #print intro statement.
    puts "Welcome! You're playing with #{deck.count} cards."
    puts "-------------------------------------------------"

    #core gameplay loop, we set the tracker variable to the amount of cards in the deck and decrement by 1 every pass.
    until cardsleftracker == 0
      puts "This is card number #{round.turns.length + 1} out of #{deck.count}."
      puts "Question: #{round.current_card.question}"
      print "> "
      answer = gets.chomp
      #calls the round.take_turn method and uses logic in that method for feedback.
      currentturn = round.take_turn(answer)
      #prints feedback from the turn object, which is returned by the take turn method.
      puts "#{currentturn.feedback}"
      cardsleftracker -= 1
    end

    puts "****** Game over! ******"
    puts "You had #{round.numbercorrect} correct guesses out of #{deck.count} for a total score of #{round.percent_correct.round}%."
    #created a helper method in the round class that returns all categories on the cards in an array. This line iterates through that array and puts the category name, then a dash, and the percentage correct by calling the percent correct by category method from the round class.
    round.category_list.each{|category| puts "#{category} - #{round.percent_correct_by_category(category).round}% correct"}
  end

end
