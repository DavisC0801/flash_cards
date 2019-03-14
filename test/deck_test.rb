require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/deck.rb'
require_relative '../lib/card.rb'

  class DeckTest < Minitest::Test

  def test_it_loads_itself_as_requirement
    assert "../lib/deck.rb"
  end

  def test_it_loads_card_as_requirement
    assert "../lib/card.rb"
  end

  def test_deck_can_access_cards
    card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck = Deck.new([card1, card2, card3])

    assert_equal [card1, card2, card3], deck.cards
  end

  def test_the_number_of_cards_in_the_deck
    card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck = Deck.new([card1, card2, card3])

    assert_equal 3, deck.count
  end

  def test_retrieves_cards_in_category
    card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck = Deck.new([card1, card2, card3])

    assert_equal [card2, card3], deck.cards_in_category(:STEM)
    assert_equal [card1], deck.cards_in_category(:Geography)
    assert_equal [], deck.cards_in_category("Pop Culture")
  end

end
