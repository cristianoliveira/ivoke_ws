require 'test_helper'

class ConversationMessagesControllerTest < ActionController::TestCase
  setup do
    @conversation_message = conversation_messages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:conversation_messages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create conversation_message" do
    assert_difference('ConversationMessage.count') do
      post :create, conversation_message: { conversation_id: @conversation_message.conversation_id, message: @conversation_message.message, status: @conversation_message.status, time: @conversation_message.time, user_id: @conversation_message.user_id }
    end

    assert_redirected_to conversation_message_path(assigns(:conversation_message))
  end

  test "should show conversation_message" do
    get :show, id: @conversation_message
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @conversation_message
    assert_response :success
  end

  test "should update conversation_message" do
    patch :update, id: @conversation_message, conversation_message: { conversation_id: @conversation_message.conversation_id, message: @conversation_message.message, status: @conversation_message.status, time: @conversation_message.time, user_id: @conversation_message.user_id }
    assert_redirected_to conversation_message_path(assigns(:conversation_message))
  end

  test "should destroy conversation_message" do
    assert_difference('ConversationMessage.count', -1) do
      delete :destroy, id: @conversation_message
    end

    assert_redirected_to conversation_messages_path
  end
end
