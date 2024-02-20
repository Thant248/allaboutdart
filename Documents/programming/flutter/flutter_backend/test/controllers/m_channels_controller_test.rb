require "test_helper"

class MChannelsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @m_channel = m_channels(:one)
  end

  test "should get index" do
    get m_channels_url, as: :json
    assert_response :success
  end

  test "should create m_channel" do
    assert_difference("MChannel.count") do
      post m_channels_url, params: { m_channel: {  } }, as: :json
    end

    assert_response :created
  end

  test "should show m_channel" do
    get m_channel_url(@m_channel), as: :json
    assert_response :success
  end

  test "should update m_channel" do
    patch m_channel_url(@m_channel), params: { m_channel: {  } }, as: :json
    assert_response :success
  end

  test "should destroy m_channel" do
    assert_difference("MChannel.count", -1) do
      delete m_channel_url(@m_channel), as: :json
    end

    assert_response :no_content
  end
end
