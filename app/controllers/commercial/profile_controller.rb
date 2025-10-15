class Commercial::ProfileController < MockupsController
  layout 'commercial'
  
  def show
    @user = mock_user_profile
    @statistics = mock_user_statistics
  end
  
  def edit
    @user = mock_user_profile
  end
  
  def update
    redirect_to mockups_commercial_profil_path, notice: "Profil mis à jour avec succès."
  end
  
  private
  
  def mock_user_profile
    {
      first_name: "Sophie",
      last_name: "Martin",
      email: "sophie.martin@example.com",
      phone: "+33 6 12 34 56 78",
      role: "sales_rep",
      team_name: "Équipe Paris",
      avatar_url: nil,
      joined_at: 6.months.ago,
      status: "active"
    }
  end
  
  def mock_user_statistics
    {
      total_calls: 30,
      analyzed_calls: 24,
      average_score: 81.2,
      best_methodology: "SYNTHÉON",
      member_since: "Il y a 6 mois"
    }
  end
end
