require "test_helper"

class TDirectMessagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @t_direct_message = t_direct_messages(:one)
  end

  test "should get index" do
    get t_direct_messages_url, as: :json
    assert_response :success
  end

  test "should create t_direct_message" do
    assert_difference("TDirectMessage.count") do
      post t_direct_messages_url, params: { t_direct_message: {  } }, as: :json
    end

    assert_response :created
  end

  test "should show t_direct_message" do
    get t_direct_message_url(@t_direct_message), as: :json
    assert_response :success
  end

  test "should update t_direct_message" do
    patch t_direct_message_url(@t_direct_message), params: { t_direct_message: {  } }, as: :json
    assert_response :success
  end

  test "should destroy t_direct_message" do
    assert_difference("TDirectMessage.count", -1) do
      delete t_direct_message_url(@t_direct_message), as: :json
    end

    assert_response :no_content
  end
end
