require 'test_helper'

class TeamTest < ActiveSupport::TestCase
  
  def setup
    @tyler = teams(:tyler)
  end
  
  test "should return the correct total" do
    assert_equal 17, @tyler.calculate_total
  end
  
  test "should return the correct points from goals" do
    assert_equal 6, @tyler.calculate_points_from_goals
  end  
  
end
