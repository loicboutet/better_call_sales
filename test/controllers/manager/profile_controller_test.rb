require "test_helper"

class Manager::ProfileControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get manager_profil_path
    assert_response :success
    assert_select "h1", "Mon Profil"
  end

  test "should get edit" do
    get manager_edit_profil_path
    assert_response :success
    assert_select "h1", "Modifier mon Profil"
  end
end
