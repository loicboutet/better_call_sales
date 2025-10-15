class Mockups::AuthController < MockupsController
  layout 'auth'
  
  def new
    # Login page
  end
  
  def create
    # Simulate login - redirect based on mock role
    role = params[:role] || 'commercial'
    
    case role
    when 'admin'
      redirect_to admin_dashboard_path, notice: "Connexion réussie en tant qu'administrateur"
    when 'manager'
      redirect_to manager_dashboard_path, notice: "Connexion réussie en tant que manager"
    else
      redirect_to commercial_dashboard_path, notice: "Connexion réussie"
    end
  end
  
  def destroy
    redirect_to mockups_login_path, notice: "Déconnexion réussie"
  end
end
