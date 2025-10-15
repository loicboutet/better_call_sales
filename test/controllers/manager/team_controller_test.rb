require "test_helper"

class Manager::TeamControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get manager_equipe_path
    assert_response :success
    assert_select "h1", text: /Équipe Paris/
  end

  test "should get members" do
    get manager_equipe_membres_path
    assert_response :success
    assert_select "h1", "Membres de l'Équipe"
  end

  test "should get member detail" do
    get manager_equipe_membre_path(id: 1)
    assert_response :success
  end
end
