require "test_helper"

class Admin::UtilisateursControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_utilisateurs_path
    assert_response :success
    assert_select "h1", "Utilisateurs"
  end

  test "should get show" do
    get admin_utilisateur_path(id: 1)
    assert_response :success
  end

  test "should get new" do
    get new_admin_utilisateur_path
    assert_response :success
    assert_select "h1", "Nouvel Utilisateur"
  end

  test "should get edit" do
    get edit_admin_utilisateur_path(id: 1)
    assert_response :success
    assert_select "h1", "Modifier l'Utilisateur"
  end
end
