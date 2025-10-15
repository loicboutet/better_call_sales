require "test_helper"

class Admin::DashboardControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_dashboard_path
    assert_response :success
    assert_select "h1", "Administration"
  end
end
