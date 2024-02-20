require "test_helper"

class TGroupStarThreadsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @t_group_star_thread = t_group_star_threads(:one)
  end

  test "should get index" do
    get t_group_star_threads_url, as: :json
    assert_response :success
  end

  test "should create t_group_star_thread" do
    assert_difference("TGroupStarThread.count") do
      post t_group_star_threads_url, params: { t_group_star_thread: {  } }, as: :json
    end

    assert_response :created
  end

  test "should show t_group_star_thread" do
    get t_group_star_thread_url(@t_group_star_thread), as: :json
    assert_response :success
  end

  test "should update t_group_star_thread" do
    patch t_group_star_thread_url(@t_group_star_thread), params: { t_group_star_thread: {  } }, as: :json
    assert_response :success
  end

  test "should destroy t_group_star_thread" do
    assert_difference("TGroupStarThread.count", -1) do
      delete t_group_star_thread_url(@t_group_star_thread), as: :json
    end

    assert_response :no_content
  end
end
