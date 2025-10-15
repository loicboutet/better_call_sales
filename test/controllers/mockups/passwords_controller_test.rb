require "test_helper"

class Mockups::PasswordsControllerTest < ActionDispatch::IntegrationTest
  test "should get new (forgot password page)" do
    get mockups_forgot_password_path
    assert_response :success
    assert_select "h2", "Mot de passe oublié ?"
  end
  
  test "should get edit (reset password page)" do
    get mockups_reset_password_path(token: "test_token")
    assert_response :success
    assert_select "h2", "Nouveau mot de passe"
  end
end
