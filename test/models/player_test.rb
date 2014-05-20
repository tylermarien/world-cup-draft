require 'test_helper'

class PlayerTest < ActiveSupport::TestCase  
  test "get number of goals" do
    messi = players(:messi)
    assert_equal 1, messi.number_of_goals
  end
end
