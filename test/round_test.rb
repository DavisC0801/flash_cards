require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/deck.rb'
require_relative '../lib/card.rb'
require_relative '../lib/round.rb'

class RoundTest < Minitest::Test

  def test_it_exists
    card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck = Deck.new([card1, card2, card3])
    round = Round.new(deck)

    assert_instance_of Round, round
  end

  def test_round_object_contains_deck_object
    card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck = Deck.new([card1, card2, card3])
    round = Round.new(deck)

    assert_equal deck, round.deck
  end

  def test_round_starts_with_empty_turns
    card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck = Deck.new([card1, card2, card3])
    round = Round.new(deck)

    assert_equal [], round.turns
  end

  def test_round_reads_current_card
    card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck = Deck.new([card1, card2, card3])
    round = Round.new(deck)

    assert_equal card1, round.current_card
    new_turn = round.take_turn("Juneau")
    assert_equal card2, round.current_card
    new_turn = round.take_turn("Mars")
    assert_equal card3, round.current_card
  end

  def test_new_turn_is_a_turn_object
    card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck = Deck.new([card1, card2, card3])
    round = Round.new(deck)
    new_turn = round.take_turn("Juneau")

    assert_instance_of Turn, new_turn
  end

  def test_new_turn_is_correct
    card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck = Deck.new([card1, card2, card3])
    round = Round.new(deck)
    new_turn = round.take_turn("Juneau")

    assert new_turn.correct?
  end

  def test_round_number_correct
    card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck = Deck.new([card1, card2, card3])
    round = Round.new(deck)
    new_turn = round.take_turn("Juneau")

    assert_equal 1, round.numbercorrect
    new_turn = round.take_turn("Mars")
    assert_equal 2, round.numbercorrect
    new_turn = round.take_turn("I Dunno")
    assert_equal 2, round.numbercorrect
  end

  def test_round_are_being_counted
    card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck = Deck.new([card1, card2, card3])
    round = Round.new(deck)
    new_turn = round.take_turn("Juneau")

    assert_equal 1, round.turns.count
    new_turn = round.take_turn("Mars")
    assert_equal 2, round.turns.count
    new_turn = round.take_turn("I Dunno")
    assert_equal 3, round.turns.count
  end

  def test_round_turn_feedback
    card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck = Deck.new([card1, card2, card3])
    round = Round.new(deck)
    new_turn = round.take_turn("Juneau")

    assert_equal "Correct!", round.turns.last.feedback
    new_turn = round.take_turn("I Dunno")
    assert_equal "Incorrect.", round.turns.last.feedback
  end

  def test_round_number_in_category_correct
    card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck = Deck.new([card1, card2, card3])
    round = Round.new(deck)
    new_turn = round.take_turn("Juneau")

    assert_equal 1, round.number_correct_by_category(card1.category)
    new_turn = round.take_turn("Mars")
    assert_equal 1, round.number_correct_by_category(card2.category)
    new_turn = round.take_turn("I Dunno")
    assert_equal 1, round.number_correct_by_category(card3.category)

  end

  def test_round_percent_correct
    card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck = Deck.new([card1, card2, card3])
    round = Round.new(deck)
    new_turn = round.take_turn("Juneau")

    assert_equal 100.0, round.percent_correct
    new_turn = round.take_turn("I Dunno")
    assert_equal 50.0, round.percent_correct
    new_turn = round.take_turn("I Dunno")
    assert_equal 33.3, round.percent_correct
  end

  def test_round_percent_correct_in_category
    card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck = Deck.new([card1, card2, card3])
    round = Round.new(deck)
    new_turn = round.take_turn("Juneau")

    assert_equal 100.0, round.percent_correct_by_category(card1.category)
    new_turn = round.take_turn("Mars")
    assert_equal 100.0, round.percent_correct_by_category(card2.category)
    new_turn = round.take_turn("I Dunno")
    assert_equal 50.0, round.percent_correct_by_category(card3.category)
  end

  def test_category_list_returns_all_categories
    card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck = Deck.new([card1, card2, card3])
    round = Round.new(deck)
    new_turn = round.take_turn("Juneau")
    new_turn = round.take_turn("Mars")
    new_turn = round.take_turn("I Dunno")

    assert_equal [:Geography, :STEM], round.category_list
  end
end
