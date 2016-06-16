require 'test_helper'

class TeamTest < ActiveSupport::TestCase

  def setup
    @tyler = teams(:tyler)
  end

  test "should return the correct matches played" do
    assert_equal 7, @tyler.calculate_matches_played
  end

  test "should return the correct total" do
    assert_equal 45, @tyler.calculate_total
  end

  test "should return the correct number of countries remaining" do
    assert_equal 1, @tyler.calculate_countries_remaining
  end

end
