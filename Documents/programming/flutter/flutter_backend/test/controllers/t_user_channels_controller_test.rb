require "test_helper"

class TUserChannelsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @t_user_channel = t_user_channels(:one)
  end

  test "should get index" do
    get t_user_channels_url, as: :json
    assert_response :success
  end

  test "should create t_user_channel" do
    assert_difference("TUserChannel.count") do
      post t_user_channels_url, params: { t_user_channel: {  } }, as: :json
    end

    assert_response :created
  end

  test "should show t_user_channel" do
    get t_user_channel_url(@t_user_channel), as: :json
    assert_response :success
  end

  test "should update t_user_channel" do
    patch t_user_channel_url(@t_user_channel), params: { t_user_channel: {  } }, as: :json
    assert_response :success
  end

  test "should destroy t_user_channel" do
    assert_difference("TUserChannel.count", -1) do
      delete t_user_channel_url(@t_user_channel), as: :json
    end

    assert_response :no_content
  end
end
