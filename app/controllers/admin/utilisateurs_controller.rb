class Admin::UtilisateursController < MockupsController
  layout 'admin'
  
  def index
    @users = mock_users_list
    @filters = { role: params[:role], status: params[:status], team: params[:team] }
  end
  
  def show
    @user = mock_user_detail(params[:id])
  end
  
  def new
    @teams = mock_teams_list
  end
  
  def create
    redirect_to admin_utilisateurs_path, notice: "Utilisateur créé avec succès."
  end
  
  def edit
    @user = mock_user_detail(params[:id])
    @teams = mock_teams_list
  end
  
  def update
    redirect_to admin_utilisateur_path(params[:id]), notice: "Utilisateur mis à jour avec succès."
  end
  
  def destroy
    redirect_to admin_utilisateurs_path, notice: "Utilisateur supprimé avec succès."
  end
  
  private
  
  def mock_users_list
    [
      { id: 1, name: "Sophie Martin", email: "sophie.martin@example.com", role: "sales_rep", team: "Équipe Paris", status: "active", last_sign_in: 2.hours.ago },
      { id: 2, name: "Jean Dupont", email: "jean.dupont@example.com", role: "manager", team: "Équipe Paris", status: "active", last_sign_in: 1.day.ago },
      { id: 3, name: "Thomas Dubois", email: "thomas.dubois@example.com", role: "sales_rep", team: "Équipe Paris", status: "active", last_sign_in: 3.hours.ago },
      { id: 4, name: "Admin Principal", email: "admin@wesales.com", role: "admin", team: nil, status: "active", last_sign_in: 30.minutes.ago }
    ]
  end
  
  def mock_user_detail(id)
    {
      id: id,
      first_name: "Sophie",
      last_name: "Martin",
      email: "sophie.martin@example.com",
      phone: "+33 6 12 34 56 78",
      role: "sales_rep",
      team_id: 1,
      team_name: "Équipe Paris",
      status: "active",
      created_at: 6.months.ago,
      last_sign_in_at: 2.hours.ago,
      total_calls: 30,
      avg_score: 81.2
    }
  end
  
  def mock_teams_list
    [
      { id: 1, name: "Équipe Paris" },
      { id: 2, name: "Équipe Lyon" },
      { id: 3, name: "Équipe Marseille" }
    ]
  end
end
