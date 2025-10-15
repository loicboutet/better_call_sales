require "test_helper"

class Manager::MembersControllerTest < ActionDispatch::IntegrationTest
  test "should get member calls" do
    get manager_membre_appels_path(id: 1)
    assert_response :success
    assert_select "h1", text: /Appels de/
  end
end
