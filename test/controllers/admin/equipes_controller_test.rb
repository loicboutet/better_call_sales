require "test_helper"

class Admin::EquipesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_equipes_path
    assert_response :success
    assert_select "h1", "Équipes"
  end

  test "should get show" do
    get admin_equipe_path(id: 1)
    assert_response :success
  end

  test "should get new" do
    get new_admin_equipe_path
    assert_response :success
    assert_select "h1", "Nouvelle Équipe"
  end

  test "should get edit" do
    get edit_admin_equipe_path(id: 1)
    assert_response :success
    assert_select "h1", "Modifier l'Équipe"
  end
end
