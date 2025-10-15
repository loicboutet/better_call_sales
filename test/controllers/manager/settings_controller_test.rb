require "test_helper"

class Manager::SettingsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get manager_parametres_path
    assert_response :success
    assert_select "h1", "Paramètres"
  end
end
