equire 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/card_generator_csv.rb'
require_relative '../lib/card.rb'

class CardGeneratorAPItest < Minitest::Test

  def setup
    @card_generator = CardGeneratorAPI.new
  end

  def test_it_exists
    assert_instance_of CardGeneratorAPI, @card_generator
  end

  def tests_default_filename
    assert_equal "cards.txt", @card_generator.filename
  end

  def test_it_can_use_other_filenames
    card_generator_test = CardGeneratorAPI.new("test.txt")

    assert_equal "test.txt", card_generator_test.filename
  end
