require "test_helper"

class Commercial::ProfileControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get commercial_profil_path
    assert_response :success
    assert_select "h1", "Mon Profil"
  end

  test "should get edit" do
    get commercial_edit_profil_path
    assert_response :success
    assert_select "h1", "Modifier mon Profil"
  end
end
