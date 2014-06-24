require 'test_helper'

class GroupTest < ActiveSupport::TestCase

  test "should be completed if all countries in group have played 3 games" do
    assert groups(:a).completed?
  end

  test "should not be completed if not all countries in group have played 3 games" do
    assert_not groups(:b).completed?
  end

end
