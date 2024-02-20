require "test_helper"

class TGroupMessagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @t_group_message = t_group_messages(:one)
  end

  test "should get index" do
    get t_group_messages_url, as: :json
    assert_response :success
  end

  test "should create t_group_message" do
    assert_difference("TGroupMessage.count") do
      post t_group_messages_url, params: { t_group_message: {  } }, as: :json
    end

    assert_response :created
  end

  test "should show t_group_message" do
    get t_group_message_url(@t_group_message), as: :json
    assert_response :success
  end

  test "should update t_group_message" do
    patch t_group_message_url(@t_group_message), params: { t_group_message: {  } }, as: :json
    assert_response :success
  end

  test "should destroy t_group_message" do
    assert_difference("TGroupMessage.count", -1) do
      delete t_group_message_url(@t_group_message), as: :json
    end

    assert_response :no_content
  end
end
