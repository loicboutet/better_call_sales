class Manager::AnalyticsController < MockupsController
  layout 'manager'
  
  def index
    @team_performance = mock_team_performance
    @methodology_breakdown = mock_methodology_breakdown
    @trends = mock_trends
  end
  
  def comparison
    @selected_members = params[:members] || [1, 2, 5]
    @members_data = mock_members_comparison(@selected_members)
    @all_members = mock_all_members_for_selection
  end
  
  def criteria
    @criteria_performance = mock_criteria_performance
    @by_methodology = mock_criteria_by_methodology
  end
  
  private
  
  def mock_team_performance
    {
      overall_score: 78.5,
      total_calls: 142,
      analyzed_calls: 128,
      improvement_rate: 8.3
    }
  end
  
  def mock_methodology_breakdown
    {
      cronos: { avg_score: 74.2, calls: 45, improvement: "+5.8%" },
      syntheon: { avg_score: 81.5, calls: 68, improvement: "+7.2%" },
      fermion: { avg_score: 77.8, calls: 29, improvement: "+3.1%" }
    }
  end
  
  def mock_trends
    [
      { date: 30.days.ago, score: 72.1 },
      { date: 25.days.ago, score: 73.8 },
      { date: 20.days.ago, score: 75.2 },
      { date: 15.days.ago, score: 76.9 },
      { date: 10.days.ago, score: 77.8 },
      { date: 5.days.ago, score: 78.1 },
      { date: Date.today, score: 78.5 }
    ]
  end
  
  def mock_all_members_for_selection
    [
      { id: 1, name: "Sophie Martin" },
      { id: 2, name: "Thomas Dubois" },
      { id: 3, name: "Marie Leroy" },
      { id: 4, name: "Pierre Bernard" },
      { id: 5, name: "Julie Moreau" },
      { id: 6, name: "Lucas Petit" }
    ]
  end
  
  def mock_members_comparison(member_ids)
    [
      { id: 1, name: "Sophie Martin", avg_score: 81.2, cronos: 76.5, syntheon: 85.2, fermion: 79.8, calls: 30 },
      { id: 2, name: "Thomas Dubois", avg_score: 79.8, cronos: 82.1, syntheon: 78.5, fermion: 78.2, calls: 28 },
      { id: 5, name: "Julie Moreau", avg_score: 82.4, cronos: 75.8, syntheon: 86.3, fermion: 83.1, calls: 19 }
    ]
  end
  
  def mock_criteria_performance
    [
      { step: "Questions SPIN (SYNTHÉON)", avg_score: 13.8, team_best: 15.0, team_worst: 11.2, count: 68 },
      { step: "Écoute active (SYNTHÉON)", avg_score: 13.2, team_best: 14.5, team_worst: 10.8, count: 68 },
      { step: "Permission opener (CRONOS)", avg_score: 12.5, team_best: 14.2, team_worst: 9.5, count: 45 },
      { step: "Reconnexion (FERMION)", avg_score: 12.1, team_best: 13.8, team_worst: 10.0, count: 29 },
      { step: "Préparation (CRONOS)", avg_score: 10.2, team_best: 13.0, team_worst: 7.5, count: 45 },
      { step: "Contrat moral (SYNTHÉON)", avg_score: 9.8, team_best: 12.5, team_worst: 7.0, count: 68 },
      { step: "Discussion prix (FERMION)", avg_score: 9.5, team_best: 12.0, team_worst: 6.8, count: 29 }
    ]
  end
  
  def mock_criteria_by_methodology
    {
      cronos: [
        { step: "Permission opener", avg: 12.5, trend: "up" },
        { step: "Valeur chiffrée", avg: 11.8, trend: "stable" },
        { step: "Préparation", avg: 10.2, trend: "up" }
      ],
      syntheon: [
        { step: "Questions SPIN", avg: 13.8, trend: "up" },
        { step: "Écoute active", avg: 13.2, trend: "stable" },
        { step: "Contrat moral", avg: 9.8, trend: "down" }
      ],
      fermion: [
        { step: "Reconnexion", avg: 12.1, trend: "stable" },
        { step: "Objections ouvertes", avg: 11.5, trend: "up" },
        { step: "Discussion prix", avg: 9.5, trend: "stable" }
      ]
    }
  end
end
