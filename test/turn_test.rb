require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/turn.rb'
require_relative '../lib/card.rb'

class TurnTest < Minitest::Test

  def setup
    @card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @turn = Turn.new("Juneau", @card)
  end

  def test_it_exists
    assert_instance_of Turn, @turn
  end

  def test_card_object_contains_all_info
    assert_equal @card.question, "What is the capital of Alaska?"
    assert_equal @card.answer, "Juneau"
    assert_equal @card.category, :Geography
  end

  def test_a_turn_object_takes_a_card_as_an_argument
    assert_equal @card, @turn.card
  end

  def test_it_has_a_guess
    assert_equal "Juneau", @turn.guess
  end

  def test_turn_object_finds_correct_answer
    turn_test = Turn.new("Juneau", @card)

    assert turn_test.correct?
  end

  def test_turn_correct_answer_feedback
    turn_test = Turn.new("Juneau", @card)

    assert_equal "Correct!", turn_test.feedback
  end

  def test_turn_finds_incorrect_answer
    turn_test = Turn.new("Saturn", @card)

    refute turn_test.correct?
  end

  def test_turn_incorrect_answer_feedback
    turn_test = Turn.new("Saturn", @card)

    assert_equal "Incorrect.", turn_test.feedback
  end
end
