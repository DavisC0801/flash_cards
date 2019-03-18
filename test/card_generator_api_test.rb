require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/card_generator_api.rb'
require_relative '../lib/card.rb'

class CardGeneratorAPItest < Minitest::Test

  def setup
    @card_generator = CardGeneratorAPI.new
  end

  def test_it_exists
    assert_instance_of CardGeneratorAPI, @card_generator
  end

  #I am unsure how to perform testing on a random dataset call. Therefore instead of automated testing I relied on the program functionality.
end
