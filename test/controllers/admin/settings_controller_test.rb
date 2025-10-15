require "test_helper"

class Admin::SettingsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_parametres_path
    assert_response :success
    assert_select "h1", "Paramètres de la Plateforme"
  end

  test "should get api" do
    get admin_parametres_api_path
    assert_response :success
    assert_select "h1", "Configuration API"
  end
end
