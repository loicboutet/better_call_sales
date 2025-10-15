class Manager::DashboardController < MockupsController
  layout 'manager'
  
  def index
    @team_stats = mock_team_stats
    @team_members_performance = mock_team_members_performance
    @recent_team_calls = mock_recent_team_calls
    @team_methodology_performance = mock_team_methodology_performance
    @top_performers = mock_top_performers
    @needs_attention = mock_needs_attention
  end
  
  private
  
  def mock_team_stats
    {
      total_members: 8,
      total_calls: 142,
      avg_team_score: 78.5,
      improvement_rate: 8.3,
      best_methodology: "SYNTHÉON"
    }
  end
  
  def mock_team_members_performance
    [
      { id: 1, name: "Sophie Martin", calls: 30, avg_score: 81.2, trend: "up", best_methodology: "SYNTHÉON" },
      { id: 2, name: "Thomas Dubois", calls: 28, avg_score: 79.8, trend: "up", best_methodology: "CRONOS" },
      { id: 3, name: "Marie Leroy", calls: 25, avg_score: 77.3, trend: "stable", best_methodology: "FERMION" },
      { id: 4, name: "Pierre Bernard", calls: 22, avg_score: 75.1, trend: "down", best_methodology: "SYNTHÉON" },
      { id: 5, name: "Julie Moreau", calls: 19, avg_score: 82.4, trend: "up", best_methodology: "SYNTHÉON" },
      { id: 6, name: "Lucas Petit", calls: 12, avg_score: 68.9, trend: "up", best_methodology: "CRONOS" },
      { id: 7, name: "Emma Rousseau", calls: 4, avg_score: 71.2, trend: "stable", best_methodology: "FERMION" },
      { id: 8, name: "Hugo Garcia", calls: 2, avg_score: 65.3, trend: "up", best_methodology: "CRONOS" }
    ]
  end
  
  def mock_recent_team_calls
    [
      { id: 1, member: "Sophie Martin", title: "Découverte - Acme Corp", call_type: "discovery_call", methodology: "SYNTHÉON", date: 1.day.ago, score: 88.1, status: "analyzed" },
      { id: 2, member: "Thomas Dubois", title: "Cold call - TechStart", call_type: "cold_call", methodology: "CRONOS", date: 1.day.ago, score: 76.5, status: "analyzed" },
      { id: 3, member: "Julie Moreau", title: "Closing - Innovatech", call_type: "closing_call", methodology: "FERMION", date: 2.days.ago, score: 90.7, status: "analyzed" },
      { id: 4, member: "Marie Leroy", title: "Négociation - Global Corp", call_type: "negotiation_call", methodology: "FERMION", date: 2.days.ago, score: 82.0, status: "analyzed" },
      { id: 5, member: "Pierre Bernard", title: "Découverte - StartupXYZ", call_type: "discovery_call", methodology: "SYNTHÉON", date: 3.days.ago, score: 0, status: "processing" }
    ]
  end
  
  def mock_team_methodology_performance
    {
      cronos: { score: 74.2, trend: "up", calls: 45, top_step: "Permission opener", weak_step: "Préparation" },
      syntheon: { score: 81.5, trend: "up", calls: 68, top_step: "Questions SPIN", weak_step: "Contrat moral" },
      fermion: { score: 77.8, trend: "stable", calls: 29, top_step: "Reconnexion", weak_step: "Discussion prix" }
    }
  end
  
  def mock_top_performers
    [
      { name: "Julie Moreau", score: 82.4, calls: 19 },
      { name: "Sophie Martin", score: 81.2, calls: 30 },
      { name: "Thomas Dubois", score: 79.8, calls: 28 }
    ]
  end
  
  def mock_needs_attention
    [
      { name: "Hugo Garcia", score: 65.3, calls: 2, issue: "Nouveau - besoin d'accompagnement" },
      { name: "Lucas Petit", score: 68.9, calls: 12, issue: "Difficulté avec FERMION" },
      { name: "Pierre Bernard", score: 75.1, calls: 22, issue: "Baisse récente de performance" }
    ]
  end
end
