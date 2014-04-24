require 'test_helper'

class UsuarioControllerTest < ActionController::TestCase
  test "should get existe" do
    get :existe
    assert_response :success
  end

end
