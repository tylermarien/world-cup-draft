require 'test_helper'

class CountryTest < ActiveSupport::TestCase

  test "should return the correct number of matches played for argentina" do
    assert_equal 1, countries(:argentina).matches_played
  end
  
  test "should return the correct number of matches played for brazil" do
    assert_equal 2, countries(:brazil).matches_played
  end
  
  test "should return the correct number of wins" do
    assert_equal 1, countries(:argentina).wins
  end
  
  test "should return the correct number of ties" do
    assert_equal 0, countries(:argentina).ties
  end
  
  test "should return the correct number of goals for argentina" do
    assert_equal 1, countries(:argentina).goals_for
  end
  
  test "should return the correct number of goals against argentina" do
    assert_equal 0, countries(:argentina).goals_against
  end
  
  test "should return the correct goal differential for argentina" do
    assert_equal 1, countries(:argentina).goal_differential
  end  

end
