require 'test_helper'

class CartsControllerTest < ActionDispatch::IntegrationTest
  test "should get add_cart_item" do
    get carts_add_cart_item_url
    assert_response :success
  end

  test "should get show" do
    get carts_show_url
    assert_response :success
  end

  test "should get delete_item" do
    get carts_delete_item_url
    assert_response :success
  end

  test "should get delete_all_items" do
    get carts_delete_all_items_url
    assert_response :success
  end

  test "should get checkout" do
    get carts_checkout_url
    assert_response :success
  end

end
