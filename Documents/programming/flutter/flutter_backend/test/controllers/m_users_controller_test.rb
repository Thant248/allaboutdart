require "test_helper"

class MUsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @m_user = m_users(:one)
  end

  test "should get index" do
    get m_users_url, as: :json
    assert_response :success
  end

  test "should create m_user" do
    assert_difference("MUser.count") do
      post m_users_url, params: { m_user: {  } }, as: :json
    end

    assert_response :created
  end

  test "should show m_user" do
    get m_user_url(@m_user), as: :json
    assert_response :success
  end

  test "should update m_user" do
    patch m_user_url(@m_user), params: { m_user: {  } }, as: :json
    assert_response :success
  end

  test "should destroy m_user" do
    assert_difference("MUser.count", -1) do
      delete m_user_url(@m_user), as: :json
    end

    assert_response :no_content
  end
end
