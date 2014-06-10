require 'test_helper'

class MatchTest < ActiveSupport::TestCase

  test "should return the correct number of goals scored by home team" do
    assert_equal 1, matches(:one).home_goals
  end
  
  test "should return the correct number of goals scored by away team" do
    assert_equal 0, matches(:one).away_goals
  end

end
