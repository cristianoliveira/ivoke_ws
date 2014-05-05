require 'test_helper'

class DebugsControllerTest < ActionController::TestCase
  setup do
    @debug = debugs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:debugs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create debug" do
    assert_difference('Debug.count') do
      post :create, debug: { message: @debug.message }
    end

    assert_redirected_to debug_path(assigns(:debug))
  end

  test "should show debug" do
    get :show, id: @debug
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @debug
    assert_response :success
  end

  test "should update debug" do
    patch :update, id: @debug, debug: { message: @debug.message }
    assert_redirected_to debug_path(assigns(:debug))
  end

  test "should destroy debug" do
    assert_difference('Debug.count', -1) do
      delete :destroy, id: @debug
    end

    assert_redirected_to debugs_path
  end
end
