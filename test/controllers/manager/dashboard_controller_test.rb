require "test_helper"

class Manager::DashboardControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get manager_dashboard_path
    assert_response :success
    assert_select "h1", text: /Tableau de bord/
  end
end
