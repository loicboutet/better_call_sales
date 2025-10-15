class Commercial::DashboardController < MockupsController
  layout 'commercial'
  
  def index
    # Mock data for dashboard
    @recent_calls = mock_recent_calls
    @performance_stats = mock_performance_stats
    @methodology_performance = mock_methodology_performance
    @recent_recommendations = mock_recommendations
  end
  
  private
  
  def mock_recent_calls
    [
      {
        id: 1,
        title: "Appel découverte - Acme Corp",
        call_type: "discovery_call",
        methodology: "syntheon",
        date: 2.days.ago,
        duration: 1845,
        overall_score: 92.5,
        max_score: 105,
        percentage: 88.1,
        status: "analyzed"
      },
      {
        id: 2,
        title: "Appel à froid - TechStart",
        call_type: "cold_call",
        methodology: "cronos",
        date: 3.days.ago,
        duration: 420,
        overall_score: 78.0,
        max_score: 105,
        percentage: 74.3,
        status: "analyzed"
      },
      {
        id: 3,
        title: "Négociation - Global Industries",
        call_type: "negotiation_call",
        methodology: "fermion",
        date: 5.days.ago,
        duration: 2100,
        overall_score: 61.5,
        max_score: 75,
        percentage: 82.0,
        status: "analyzed"
      }
    ]
  end
  
  def mock_performance_stats
    {
      total_calls: 24,
      avg_score: 81.2,
      improvement_rate: 12.5,
      best_methodology: "SYNTHÉON"
    }
  end
  
  def mock_methodology_performance
    {
      cronos: { score: 76.5, trend: "up", calls: 8 },
      syntheon: { score: 85.2, trend: "up", calls: 10 },
      fermion: { score: 79.8, trend: "stable", calls: 6 }
    }
  end
  
  def mock_recommendations
    [
      "Améliorer la phase de Préparation (CRONOS) - Score moyen: 11/15",
      "Renforcer l'Écoute Active (SYNTHÉON) - Opportunité d'amélioration",
      "Travailler la gestion des Objections ouvertes (FERMION)"
    ]
  end
end
