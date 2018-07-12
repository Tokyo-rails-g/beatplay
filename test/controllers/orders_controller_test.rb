require 'test_helper'

class OrdersControllerTest < ActionDispatch::IntegrationTest
  test "should get select_address" do
    get orders_select_address_url
    assert_response :success
  end

  test "should get create_address" do
    get orders_create_address_url
    assert_response :success
  end

  test "should get confirm" do
    get orders_confirm_url
    assert_response :success
  end

  test "should get create" do
    get orders_create_url
    assert_response :success
  end

  test "should get show" do
    get orders_show_url
    assert_response :success
  end

end
