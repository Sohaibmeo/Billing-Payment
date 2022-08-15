require "test_helper"

class OverchargeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get overcharge_index_url
    assert_response :success
  end

  test "should get show" do
    get overcharge_show_url
    assert_response :success
  end
end
