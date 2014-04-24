require 'test_helper'

class MuralPostsControllerTest < ActionController::TestCase
  setup do
    @mural_post = mural_posts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mural_posts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mural_post" do
    assert_difference('MuralPost.count') do
      post :create, mural_post: { from: @mural_post.from, latitude: @mural_post.latitude, longitude: @mural_post.longitude, message: @mural_post.message, posted_at: @mural_post.posted_at, usuario_id: @mural_post.usuario_id }
    end

    assert_redirected_to mural_post_path(assigns(:mural_post))
  end

  test "should show mural_post" do
    get :show, id: @mural_post
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mural_post
    assert_response :success
  end

  test "should update mural_post" do
    patch :update, id: @mural_post, mural_post: { from: @mural_post.from, latitude: @mural_post.latitude, longitude: @mural_post.longitude, message: @mural_post.message, posted_at: @mural_post.posted_at, usuario_id: @mural_post.usuario_id }
    assert_redirected_to mural_post_path(assigns(:mural_post))
  end

  test "should destroy mural_post" do
    assert_difference('MuralPost.count', -1) do
      delete :destroy, id: @mural_post
    end

    assert_redirected_to mural_posts_path
  end
end
