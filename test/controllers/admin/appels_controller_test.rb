require "test_helper"

class Admin::AppelsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_appels_path
    assert_response :success
    assert_select "h1", "Tous les Appels"
  end

  test "should get show" do
    get admin_appel_path(id: 1)
    assert_response :success
  end
end
