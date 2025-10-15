class Manager::ProfileController < MockupsController
  layout 'manager'
  
  def show
    @user = mock_manager_profile
    @statistics = mock_manager_statistics
  end
  
  def edit
    @user = mock_manager_profile
  end
  
  def update
    redirect_to manager_profil_path, notice: "Profil mis à jour avec succès."
  end
  
  private
  
  def mock_manager_profile
    {
      first_name: "Jean",
      last_name: "Dupont",
      email: "jean.dupont@example.com",
      phone: "+33 6 98 76 54 32",
      role: "manager",
      team_name: "Équipe Paris",
      avatar_url: nil,
      joined_at: 2.years.ago,
      status: "active"
    }
  end
  
  def mock_manager_statistics
    {
      team_members: 8,
      team_calls: 142,
      team_avg_score: 78.5,
      manager_since: "Il y a 2 ans"
    }
  end
end
