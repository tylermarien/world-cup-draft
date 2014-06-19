require 'test_helper'

class CountriesControllerTest < ActionController::TestCase

  setup do
    @country = countries(:argentina)
  end

  test "should show country" do
    get :show, id: @country
    assert_response :success
  end
  
  test "should show most popular" do
    get :most_popular
    assert_response :success
  end

end
