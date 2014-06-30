require 'test_helper'

class PlayerTest < ActiveSupport::TestCase  
  
  def setup
    @messi = players(:messi)
  end
  
  test "should return the correct number of goals" do
    assert_equal 1, @messi.goals
  end
  
  test "should return the correct points from goals" do
    assert_equal 2, @messi.calculate_points_from_goals
  end
  
  test "should return the correct points from shootout goals" do
    assert_equal 1, @messi.calculate_points_from_shootout_goals
  end
  
end
