require "test_helper"

class Commercial::AppelsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get commercial_appels_path
    assert_response :success
    assert_select "h1", "Mes Appels"
  end

  test "should get show" do
    get commercial_appel_path(id: 1)
    assert_response :success
  end

  test "should get new" do
    get new_commercial_appel_path
    assert_response :success
    assert_select "h1", "Télécharger un Appel"
  end

  test "should get edit" do
    get edit_commercial_appel_path(id: 1)
    assert_response :success
    assert_select "h1", "Modifier l'Appel"
  end

  test "should get analyse" do
    get analyse_commercial_appel_path(id: 1)
    assert_response :success
    assert_select "h1", "Analyse Détaillée"
  end

  test "should get transcription" do
    get transcription_commercial_appel_path(id: 1)
    assert_response :success
    assert_select "h1", "Transcription"
  end
end
