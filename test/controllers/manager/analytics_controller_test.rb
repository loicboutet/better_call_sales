require "test_helper"

class Manager::AnalyticsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get manager_analyses_path
    assert_response :success
    assert_select "h1", "Analyses de l'Équipe"
  end

  test "should get comparison" do
    get manager_analyses_comparaison_path
    assert_response :success
    assert_select "h1", "Comparaison des Membres"
  end

  test "should get criteria" do
    get manager_analyses_criteres_path
    assert_response :success
    assert_select "h1", "Performance par Critères"
  end
end
