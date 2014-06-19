require 'test_helper'

class PlayersControllerTest < ActionController::TestCase

  test "should show most popular" do
    get :most_popular
    assert_response :success
  end

end
