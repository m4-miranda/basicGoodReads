require 'test_helper'

class UserControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get user_home_url
    assert_response :success
  end

  test "should get favorites" do
    get user_favorites_url
    assert_response :success
  end

  test "should get read" do
    get user_read_url
    assert_response :success
  end

  test "should get toread" do
    get user_toread_url
    assert_response :success
  end

  test "should get reading" do
    get user_reading_url
    assert_response :success
  end

end
