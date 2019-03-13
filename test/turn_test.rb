require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/turn.rb'
require_relative '../lib/card.rb'

class TurnTest < Minitest::Test

  def test_it_loads_itself_as_requirement
    assert '../lib/turn.rb'
  end

  def test_it_loads_card_as_requirement
    assert '../lib/card.rb'
  end

  def test_card_object_contains_all_info
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

    assert_equal card.question, "What is the capital of Alaska?"
    assert_equal card.answer, "Juneau"
    assert_equal card.category, :Geography
  end

  def test_a_turn_object_takes_a_card_as_an_argument
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    assert_equal card, turn.card
  end

  def test_it_has_a_guess
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    assert_equal "Juneau", turn.guess
  end

  def test_turn_object_finds_correct_answer
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    assert turn.correct?
  end

  def test_turn_correct_answer_feedback
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    assert_equal "Correct!", turn.feedback
  end

  def test_turn_finds_incorrect_answer
    card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
    turn = Turn.new("Saturn", card)

    refute turn.correct?
  end

  def test_turn_incorrect_answer_feedback
    card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
    turn = Turn.new("Saturn", card)

    assert_equal "Incorrect.", turn.feedback
  end
end
