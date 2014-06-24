require 'test_helper'

class TeamTest < ActiveSupport::TestCase
  
  def setup
    @tyler = teams(:tyler)
  end
  
  test "should return the correct total" do
    assert_equal 34, @tyler.calculate_total
  end
  
end
