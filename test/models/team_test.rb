require 'test_helper'

class TeamTest < ActiveSupport::TestCase
  
  test "should return the correct total" do
    tyler = teams(:tyler)
    assert_equal 3, tyler.calculate_total
  end
  
end
