require 'test_helper'

class TeamTest < ActiveSupport::TestCase
  test "total returns the correct amount" do
    tyler = teams(:tyler)
    assert_equal 3, tyler.total
  end
end
