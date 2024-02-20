require "test_helper"

class TDirectStarThreadsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @t_direct_star_thread = t_direct_star_threads(:one)
  end

  test "should get index" do
    get t_direct_star_threads_url, as: :json
    assert_response :success
  end

  test "should create t_direct_star_thread" do
    assert_difference("TDirectStarThread.count") do
      post t_direct_star_threads_url, params: { t_direct_star_thread: {  } }, as: :json
    end

    assert_response :created
  end

  test "should show t_direct_star_thread" do
    get t_direct_star_thread_url(@t_direct_star_thread), as: :json
    assert_response :success
  end

  test "should update t_direct_star_thread" do
    patch t_direct_star_thread_url(@t_direct_star_thread), params: { t_direct_star_thread: {  } }, as: :json
    assert_response :success
  end

  test "should destroy t_direct_star_thread" do
    assert_difference("TDirectStarThread.count", -1) do
      delete t_direct_star_thread_url(@t_direct_star_thread), as: :json
    end

    assert_response :no_content
  end
end
