require "test_helper"

class TDirectStarMsgsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @t_direct_star_msg = t_direct_star_msgs(:one)
  end

  test "should get index" do
    get t_direct_star_msgs_url, as: :json
    assert_response :success
  end

  test "should create t_direct_star_msg" do
    assert_difference("TDirectStarMsg.count") do
      post t_direct_star_msgs_url, params: { t_direct_star_msg: {  } }, as: :json
    end

    assert_response :created
  end

  test "should show t_direct_star_msg" do
    get t_direct_star_msg_url(@t_direct_star_msg), as: :json
    assert_response :success
  end

  test "should update t_direct_star_msg" do
    patch t_direct_star_msg_url(@t_direct_star_msg), params: { t_direct_star_msg: {  } }, as: :json
    assert_response :success
  end

  test "should destroy t_direct_star_msg" do
    assert_difference("TDirectStarMsg.count", -1) do
      delete t_direct_star_msg_url(@t_direct_star_msg), as: :json
    end

    assert_response :no_content
  end
end
