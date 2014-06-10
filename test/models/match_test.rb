require 'test_helper'

class MatchTest < ActiveSupport::TestCase

  test "should return the correct number of goals scored by home team" do
    assert_equal 1, matches(:one).home_goals
  end

end
