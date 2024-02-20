require "test_helper"

class MWorkspacesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @m_workspace = m_workspaces(:one)
  end

  test "should get index" do
    get m_workspaces_url, as: :json
    assert_response :success
  end

  test "should create m_workspace" do
    assert_difference("MWorkspace.count") do
      post m_workspaces_url, params: { m_workspace: {  } }, as: :json
    end

    assert_response :created
  end

  test "should show m_workspace" do
    get m_workspace_url(@m_workspace), as: :json
    assert_response :success
  end

  test "should update m_workspace" do
    patch m_workspace_url(@m_workspace), params: { m_workspace: {  } }, as: :json
    assert_response :success
  end

  test "should destroy m_workspace" do
    assert_difference("MWorkspace.count", -1) do
      delete m_workspace_url(@m_workspace), as: :json
    end

    assert_response :no_content
  end
end
