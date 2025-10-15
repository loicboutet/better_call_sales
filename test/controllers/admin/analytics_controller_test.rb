require "test_helper"

class Admin::AnalyticsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_analyses_path
    assert_response :success
    assert_select "h1", "Analytics Plateforme"
  end

  test "should get usage" do
    get admin_analyses_utilisation_path
    assert_response :success
    assert_select "h1", "Statistiques d'Utilisation"
  end

  test "should get performance" do
    get admin_analyses_performance_path
    assert_response :success
    assert_select "h1", "Performance Système"
  end
end
