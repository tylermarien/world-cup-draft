require 'test_helper'

class Admin::PlayersControllerTest < ActionController::TestCase
  setup do
    sign_in users(:tyler)
    @player = players(:messi)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:players)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create player" do
    assert_difference('Player.count') do
      post :create, player: { country_id: @player.country_id, name: @player.name }
    end

    assert_redirected_to admin_player_path(assigns(:player))
  end

  test "should show player" do
    get :show, id: @player
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @player
    assert_response :success
  end

  test "should update player" do
    patch :update, id: @player, player: { country_id: @player.country_id, name: @player.name }
    assert_redirected_to admin_player_path(assigns(:player))
  end

  test "should destroy player" do
    assert_difference('Player.count', -1) do
      delete :destroy, id: @player
    end

    assert_redirected_to admin_players_path
  end
end
