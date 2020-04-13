require 'test_helper'

class GameV2sControllerTest < ActionDispatch::IntegrationTest
  setup do
    @game_v2 = game_v2s(:one)
  end

  test "should get index" do
    get game_v2s_url
    assert_response :success
  end

  test "should get new" do
    get new_game_v2_url
    assert_response :success
  end

  test "should create game_v2" do
    assert_difference('GameV2.count') do
      post game_v2s_url, params: { game_v2: { name: @game_v2.name } }
    end

    assert_redirected_to game_v2_url(GameV2.last)
  end

  test "should show game_v2" do
    get game_v2_url(@game_v2)
    assert_response :success
  end

  test "should get edit" do
    get edit_game_v2_url(@game_v2)
    assert_response :success
  end

  test "should update game_v2" do
    patch game_v2_url(@game_v2), params: { game_v2: { name: @game_v2.name } }
    assert_redirected_to game_v2_url(@game_v2)
  end

  test "should destroy game_v2" do
    assert_difference('GameV2.count', -1) do
      delete game_v2_url(@game_v2)
    end

    assert_redirected_to game_v2s_url
  end
end
