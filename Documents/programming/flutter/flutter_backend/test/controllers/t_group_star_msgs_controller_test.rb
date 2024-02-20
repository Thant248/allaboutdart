require "test_helper"

class TGroupStarMsgsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @t_group_star_msg = t_group_star_msgs(:one)
  end

  test "should get index" do
    get t_group_star_msgs_url, as: :json
    assert_response :success
  end

  test "should create t_group_star_msg" do
    assert_difference("TGroupStarMsg.count") do
      post t_group_star_msgs_url, params: { t_group_star_msg: {  } }, as: :json
    end

    assert_response :created
  end

  test "should show t_group_star_msg" do
    get t_group_star_msg_url(@t_group_star_msg), as: :json
    assert_response :success
  end

  test "should update t_group_star_msg" do
    patch t_group_star_msg_url(@t_group_star_msg), params: { t_group_star_msg: {  } }, as: :json
    assert_response :success
  end

  test "should destroy t_group_star_msg" do
    assert_difference("TGroupStarMsg.count", -1) do
      delete t_group_star_msg_url(@t_group_star_msg), as: :json
    end

    assert_response :no_content
  end
end
