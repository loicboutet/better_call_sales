require "test_helper"

class Manager::AppelsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get manager_appels_path
    assert_response :success
    assert_select "h1", "Appels de l'Équipe"
  end

  test "should get show" do
    get manager_appel_path(id: 1)
    assert_response :success
  end
  
  test "should get analyse" do
    get analyse_manager_appel_path(id: 1)
    assert_response :success
    assert_select "h1", "Analyse Détaillée"
  end
end
