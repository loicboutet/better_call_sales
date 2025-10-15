require "test_helper"

class Admin::CriteresControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_criteres_path
    assert_response :success
    assert_select "h1", "Critères d'Analyse"
  end

  test "should get show" do
    get admin_critere_path(id: 1)
    assert_response :success
  end

  test "should get new" do
    get new_admin_critere_path
    assert_response :success
    assert_select "h1", "Nouveau Critère"
  end

  test "should get edit" do
    get edit_admin_critere_path(id: 1)
    assert_response :success
    assert_select "h1", "Modifier le Critère"
  end
end
