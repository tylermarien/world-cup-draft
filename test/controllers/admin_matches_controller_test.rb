require 'test_helper'

class Admin::MatchesControllerTest < ActionController::TestCase
  setup do
    sign_in users(:tyler)
    @match = matches(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:matches)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create match" do
    assert_difference('Match.count') do
      post :create, match: { away_id: @match.away_id, home_id: @match.home_id, occurs_at: @match.occurs_at }
    end

    assert_redirected_to admin_match_path(assigns(:match))
  end

  test "should show match" do
    get :show, id: @match
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @match
    assert_response :success
  end

  test "should update match" do
    patch :update, id: @match, match: { away_id: @match.away_id, home_id: @match.home_id, occurs_at: @match.occurs_at }
    assert_redirected_to admin_match_path(assigns(:match))
  end

  test "should destroy match" do
    assert_difference('Match.count', -1) do
      delete :destroy, id: @match
    end

    assert_redirected_to admin_matches_path
  end
end
