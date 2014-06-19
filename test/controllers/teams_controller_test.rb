require 'test_helper'

class TeamsControllerTest < ActionController::TestCase

  def setup
    @team = teams(:tyler)
  end

  test "should show team" do
    get :show, id: @team
    assert_response :success
  end

end
