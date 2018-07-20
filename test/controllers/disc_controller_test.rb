require 'test_helper'

class DiscControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get disc_edit_url
    assert_response :success
  end

  test "should get update" do
    get disc_update_url
    assert_response :success
  end

end
