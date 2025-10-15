require "test_helper"

class Commercial::ProgressControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get commercial_progress_path
    assert_response :success
    assert_select "h1", "Ma Progression"
  end
end
