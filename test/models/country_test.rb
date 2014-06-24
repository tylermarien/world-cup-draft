require 'test_helper'

class CountryTest < ActiveSupport::TestCase

  test "should return the correct number of matches played for argentina" do
    assert_equal 3, countries(:argentina).matches_played
  end
  
  test "should return the correct number of matches played for brazil" do
    assert_equal 3, countries(:brazil).matches_played
  end
  
  test "should return the correct number of wins" do
    assert_equal 2, countries(:argentina).wins
  end
  
  test "should return the correct number of ties" do
    assert_equal 1, countries(:argentina).ties
  end
  
  test "should return the correct number of goals for argentina" do
    assert_equal 3, countries(:argentina).goals_for
  end
  
  test "should return the correct number of goals against argentina" do
    assert_equal 0, countries(:argentina).goals_against
  end
  
  test "should return the correct goal differential for argentina" do
    assert_equal 3, countries(:argentina).goal_differential
  end
  
  test "should return the correct goal differential for spain" do
    assert_equal 2, countries(:spain).goal_differential
  end  
  
  test "should return the correct number of shutouts" do
    assert_equal 3, countries(:argentina).shutouts
  end
  
  test "should return the correct points from matches played" do
    assert_equal 3, countries(:brazil).calculate_points_from_matches_played
  end
  
  test "should return the correct points from wins" do
    assert_equal 8, countries(:argentina).calculate_points_from_wins
  end
  
  test "should return the correct points from ties" do
    assert_equal 2, countries(:brazil).calculate_points_from_ties
  end
  
  test "should return the correct points from goal differential" do
    assert_equal 2, countries(:brazil).calculate_points_from_goal_differential
  end
  
  test "should return the correct points from shutouts" do
    assert_equal 3, countries(:argentina).calculate_points_from_shutouts
  end  

end
