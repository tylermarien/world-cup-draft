require 'test_helper'

class TeamTest < ActiveSupport::TestCase
  
  def setup
    @tyler = teams(:tyler)
  end
  
  test "should return the correct total" do
    assert_equal 15, @tyler.calculate_total
  end
  
  test "should return the correct points from matches played" do
    assert_equal 3, @tyler.calculate_points_from_matches_played
  end
  
  test "should return the correct points from wins" do
    assert_equal 4, @tyler.calculate_points_from_wins
  end
  
  test "should return the correct points from ties" do
    assert_equal 2, @tyler.calculate_points_from_ties
  end
  
  test "should return the correct points from goal differential" do
    assert_equal -1, @tyler.calculate_points_from_goal_differential
  end
  
  test "should return the correct points from shutouts" do
    assert_equal 1, @tyler.calculate_points_from_shutouts
  end
  
  test "should return the correct points from goals" do
    assert_equal 6, @tyler.calculate_points_from_goals
  end  
  
end
