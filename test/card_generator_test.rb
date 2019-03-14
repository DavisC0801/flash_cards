require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/card_generator.rb'
require_relative '../lib/card.rb'

class CardGeneratorTest < Minitest::Test

  def test_it_exists
    card_generator = CardGenerator.new

    assert_instance_of CardGenerator, card_generator
  end

  def tests_default_filename
    card_generator = CardGenerator.new

    assert_equal "cards.txt", card_generator.filename
  end

  def test_it_can_use_other_filenames
    card_generator = CardGenerator.new("test.txt")

    assert_equal "test.txt", card_generator.filename
  end

  def test_cards_can_be_generated
    #assume default file
    card1 = Card.new("What is 5 + 5?", "10", "STEM")
    card2 = Card.new("What is Rachel's favorite animal?", "red panda", "Turing Staff")
    card3 = Card.new("What is Mike's middle name?", "nobody knows", "Turing Staff")
    card4 = Card.new("What cardboard cutout lives at Turing?", "Justin bieber", "Pop Culture")
    card_generator = CardGenerator.new
    card_generator.cardgen

    assert_equal card1.question, card_generator.cards[0].question
    assert_equal card1.answer, card_generator.cards[0].answer
    assert_equal card1.category, card_generator.cards[0].category
    assert_equal card2.question, card_generator.cards[1].question
    assert_equal card2.answer, card_generator.cards[1].answer
    assert_equal card2.category, card_generator.cards[1].category
    assert_equal card3.question, card_generator.cards[2].question
    assert_equal card3.answer, card_generator.cards[2].answer
    assert_equal card3.category, card_generator.cards[2].category
    assert_equal card4.question, card_generator.cards[3].question
    assert_equal card4.answer, card_generator.cards[3].answer
    assert_equal card4.category, card_generator.cards[3].category

  end
end
