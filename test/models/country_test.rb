require 'test_helper'

class CountryTest < ActiveSupport::TestCase

  test "should return the correct number of matches played when all matches are home matches" do
    assert_equal 1, countries(:argentina).matches_played
  end
  
  test "should return the correct number of matches played when all matches are away matches" do
    assert_equal 1, countries(:brazil).matches_played
  end
  
  test "should return the correct number of wins" do
    assert_equal 1, countries(:argentina).wins
  end
  
  test "should return the correct number of ties" do
    assert_equal 0, countries(:argentina).ties
  end  

end
