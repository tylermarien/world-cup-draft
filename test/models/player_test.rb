require 'test_helper'

class PlayerTest < ActiveSupport::TestCase  
  
  test "should return the correct number of goals" do
    messi = players(:messi)
    assert_equal 1, messi.calculate_goals
  end
  
end
