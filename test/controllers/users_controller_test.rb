require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get confirm" do
    get users_confirm_url
    assert_response :success
  end

  test "should get mypage" do
    get users_mypage_url
    assert_response :success
  end

  test "should get edit" do
    get users_edit_url
    assert_response :success
  end

  test "should get edit_name" do
    get users_edit_name_url
    assert_response :success
  end

  test "should get edit_address" do
    get users_edit_address_url
    assert_response :success
  end

  test "should get edit_phonenumber" do
    get users_edit_phonenumber_url
    assert_response :success
  end

  test "should get edit_email" do
    get users_edit_email_url
    assert_response :success
  end

  test "should get edit_password" do
    get users_edit_password_url
    assert_response :success
  end

  test "should get update" do
    get users_update_url
    assert_response :success
  end

end
