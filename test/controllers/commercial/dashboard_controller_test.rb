require "test_helper"

class Commercial::DashboardControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get commercial_dashboard_path
    assert_response :success
    assert_select "h1", "Tableau de bord"
  end
end
