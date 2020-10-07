require 'test_helper'

class MiniUrlsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mini_url = mini_urls(:one)
  end

  test "should get index" do
    get mini_urls_url
    assert_response :success
  end

  test "should get new" do
    get new_mini_url_url
    assert_response :success
  end

  test "should create mini_url" do
    assert_difference('MiniUrl.count') do
      post mini_urls_url, params: { mini_url: { full_url: @mini_url.full_url, short_url: @mini_url.short_url } }
    end

    assert_redirected_to mini_url_url(MiniUrl.last)
  end

  test "should show mini_url" do
    get mini_url_url(@mini_url)
    assert_response :success
  end

  test "should get edit" do
    get edit_mini_url_url(@mini_url)
    assert_response :success
  end

  test "should update mini_url" do
    patch mini_url_url(@mini_url), params: { mini_url: { full_url: @mini_url.full_url, short_url: @mini_url.short_url } }
    assert_redirected_to mini_url_url(@mini_url)
  end

  test "should destroy mini_url" do
    assert_difference('MiniUrl.count', -1) do
      delete mini_url_url(@mini_url)
    end

    assert_redirected_to mini_urls_url
  end
end
