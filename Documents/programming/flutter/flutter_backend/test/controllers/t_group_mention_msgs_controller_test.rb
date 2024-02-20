require "test_helper"

class TGroupMentionMsgsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @t_group_mention_msg = t_group_mention_msgs(:one)
  end

  test "should get index" do
    get t_group_mention_msgs_url, as: :json
    assert_response :success
  end

  test "should create t_group_mention_msg" do
    assert_difference("TGroupMentionMsg.count") do
      post t_group_mention_msgs_url, params: { t_group_mention_msg: {  } }, as: :json
    end

    assert_response :created
  end

  test "should show t_group_mention_msg" do
    get t_group_mention_msg_url(@t_group_mention_msg), as: :json
    assert_response :success
  end

  test "should update t_group_mention_msg" do
    patch t_group_mention_msg_url(@t_group_mention_msg), params: { t_group_mention_msg: {  } }, as: :json
    assert_response :success
  end

  test "should destroy t_group_mention_msg" do
    assert_difference("TGroupMentionMsg.count", -1) do
      delete t_group_mention_msg_url(@t_group_mention_msg), as: :json
    end

    assert_response :no_content
  end
end
