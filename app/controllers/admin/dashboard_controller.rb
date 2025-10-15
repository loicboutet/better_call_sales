class Admin::DashboardController < MockupsController
  layout 'admin'
  
  def index
    @platform_stats = mock_platform_stats
    @user_stats = mock_user_stats
    @recent_activity = mock_recent_activity
    @call_distribution = mock_call_distribution
  end
  
  private
  
  def mock_platform_stats
    {
      total_users: 45,
      total_teams: 5,
      total_calls: 487,
      analyzed_calls: 432,
      avg_platform_score: 77.8
    }
  end
  
  def mock_user_stats
    {
      admins: 2,
      managers: 5,
      sales_reps: 38,
      active_users: 42,
      inactive_users: 3
    }
  end
  
  def mock_recent_activity
    [
      { type: "user_created", message: "Nouvel utilisateur créé : Emma Rousseau", time: 2.hours.ago },
      { type: "analysis_completed", message: "142 appels analysés aujourd'hui", time: 3.hours.ago },
      { type: "team_created", message: "Nouvelle équipe créée : Équipe Lyon", time: 1.day.ago }
    ]
  end
  
  def mock_call_distribution
    {
      cold_call: 145,
      discovery_call: 198,
      negotiation_call: 87,
      closing_call: 42,
      rfp_call: 15
    }
  end
end
