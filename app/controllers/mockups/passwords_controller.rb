class Mockups::PasswordsController < MockupsController
  layout 'auth'
  
  def new
    # Forgot password page
  end
  
  def create
    redirect_to mockups_login_path, notice: "Instructions de réinitialisation envoyées par email"
  end
  
  def edit
    @token = params[:token]
    # Reset password page
  end
  
  def update
    redirect_to mockups_login_path, notice: "Mot de passe réinitialisé avec succès"
  end
end
