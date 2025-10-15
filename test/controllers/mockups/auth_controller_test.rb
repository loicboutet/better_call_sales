require "test_helper"

class Mockups::AuthControllerTest < ActionDispatch::IntegrationTest
  test "should get new (login page)" do
    get mockups_login_path
    assert_response :success
    assert_select "h2", "Connexion"
  end
  
  test "should create session and redirect to commercial dashboard" do
    post mockups_login_path, params: { email: "test@example.com", password: "password", role: "commercial" }
    assert_redirected_to commercial_dashboard_path
  end
  
  test "should create session and redirect to manager dashboard" do
    post mockups_login_path, params: { email: "test@example.com", password: "password", role: "manager" }
    assert_redirected_to manager_dashboard_path
  end
  
  test "should create session and redirect to admin dashboard" do
    post mockups_login_path, params: { email: "test@example.com", password: "password", role: "admin" }
    assert_redirected_to admin_dashboard_path
  end
end
