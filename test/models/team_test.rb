require 'test_helper'

class TeamTest < ActiveSupport::TestCase
  
  test "should return the correct total" do
    tyler = teams(:tyler)
    assert_equal 4, tyler.calculate_total
  end
  
  test "should return the correct points from goals" do
    tyler = teams(:tyler)
    assert_equal 3, tyler.calculate_points_from_goals    
  end
  
  test "should return the correct points from matches played" do
    tyler = teams(:tyler)
    assert_equal 1, tyler.calculate_points_from_matches_played
  end
  
  test "should return the correct points from wins" do
    tyler = teams(:tyler)
    assert_equal 4, tyler.calculate_points_from_wins
  end  
  
end
