require 'test_helper'

class CountryTest < ActiveSupport::TestCase

  test "should return the correct number of matches played for argentina" do
    assert_equal 4, countries(:argentina).matches_played
  end
  
  test "should return the correct number of matches played for brazil" do
    assert_equal 3, countries(:brazil).matches_played
  end
  
  test "should return the correct number of wins" do
    assert_equal 3, countries(:argentina).wins
  end
  
  test "should return the correct number of ties" do
    assert_equal 1, countries(:argentina).ties
  end
  
  test "should return the correct goal differential for argentina" do
    assert_equal 3, countries(:argentina).goal_differential
  end
  
  test "should return the correct goal differential for spain" do
    assert_equal 2, countries(:spain).goal_differential
  end  
  
  test "should return the correct number of shutouts" do
    assert_equal 4, countries(:argentina).shutouts
  end
  
  test "should return the correct points from matches played" do
    assert_equal 3, countries(:brazil).calculate_points_from_matches_played
  end
  
  test "should return the correct points from wins" do
    assert_equal 12, countries(:argentina).calculate_points_from_wins
  end
  
  test "should return the correct points from ties" do
    assert_equal 2, countries(:brazil).calculate_points_from_ties
  end
  
  test "should return the correct points from goal differential" do
    assert_equal 2, countries(:brazil).calculate_points_from_goal_differential
  end
  
  test "should return the correct points from shutouts" do
    assert_equal 4, countries(:argentina).calculate_points_from_shutouts
  end
  
  test "should return no points for group rank if group is not completed" do
    assert_equal 0, countries(:netherlands).calculate_points_from_group_rank
  end
  
  test "should return 4 points for coming first in group" do
    assert_equal 4, countries(:argentina).calculate_points_from_group_rank
  end
  
  test "should return 2 points for coming second in group" do
    assert_equal 2, countries(:brazil).calculate_points_from_group_rank
  end
  
  test "should return 1 points for coming third in group" do
    assert_equal 1, countries(:spain).calculate_points_from_group_rank
  end
  
  test "should return 0 points for coming fourth in group" do
    assert_equal 0, countries(:england).calculate_points_from_group_rank
  end
  
  test "should return correct total points for argentina" do
    assert_equal 29, countries(:argentina).calculate_total
  end
  
  test "should not be eliminated if group is not completed" do
    assert_not countries(:netherlands).eliminated?
  end
  
  test "should be eliminated if finished third or fourth in group" do
    assert countries(:england).eliminated?
  end
  
  test "should not be eliminated if finished first or second in group" do
    assert_not countries(:brazil).eliminated?
  end
  
  test "should return correct number of shootout wins for brazil" do
    assert_equal 0, countries(:brazil).shootout_wins
  end
  
  test "should return correct number of shootout wins for argentina" do
    assert_equal 1, countries(:argentina).shootout_wins
  end
  
  test "should return the correct number of points from shootout wins from brazil" do
    assert_equal 0, countries(:brazil).calculate_points_from_shootout_wins
  end
  
  test "should return the correct number of points from shootout wins from argentina" do
    assert_equal 1, countries(:argentina).calculate_points_from_shootout_wins
  end  

end
