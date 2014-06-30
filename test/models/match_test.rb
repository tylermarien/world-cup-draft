require 'test_helper'

class MatchTest < ActiveSupport::TestCase

  test "should return the correct number of goals scored by home team" do
    assert_equal 1, matches(:one).home_score
  end
  
  test "should return the correct number of goals scored by away team" do
    assert_equal 0, matches(:one).away_score
  end
  
  test "should return the winning team" do
    assert_equal countries(:argentina).id, matches(:one).winning_country.id
  end
  
  test "should return the winning team in shootout" do
    assert_equal countries(:argentina).id, matches(:seven).winning_country.id
  end
  
  test "should return false since the match was not tied" do
    assert_not matches(:one).tie?
  end
  
  test "should return false since the match went to shootouts" do
    assert_not matches(:seven).tie?
  end  

end
