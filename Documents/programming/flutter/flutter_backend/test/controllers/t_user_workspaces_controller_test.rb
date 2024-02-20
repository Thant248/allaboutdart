require "test_helper"

class TUserWorkspacesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @t_user_workspace = t_user_workspaces(:one)
  end

  test "should get index" do
    get t_user_workspaces_url, as: :json
    assert_response :success
  end

  test "should create t_user_workspace" do
    assert_difference("TUserWorkspace.count") do
      post t_user_workspaces_url, params: { t_user_workspace: {  } }, as: :json
    end

    assert_response :created
  end

  test "should show t_user_workspace" do
    get t_user_workspace_url(@t_user_workspace), as: :json
    assert_response :success
  end

  test "should update t_user_workspace" do
    patch t_user_workspace_url(@t_user_workspace), params: { t_user_workspace: {  } }, as: :json
    assert_response :success
  end

  test "should destroy t_user_workspace" do
    assert_difference("TUserWorkspace.count", -1) do
      delete t_user_workspace_url(@t_user_workspace), as: :json
    end

    assert_response :no_content
  end
end
