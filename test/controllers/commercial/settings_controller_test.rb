require "test_helper"

class Commercial::SettingsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get commercial_parametres_path
    assert_response :success
    assert_select "h1", "Paramètres"
  end
end
