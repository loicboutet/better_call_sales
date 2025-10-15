class Manager::TeamController < MockupsController
  layout 'manager'
  
  def show
    @team = mock_team_info
    @team_stats = mock_team_stats
  end
  
  def members
    @team = mock_team_info
    @members = mock_team_members
  end
  
  def member
    @member = mock_member_detail(params[:id])
    @member_calls = mock_member_calls(params[:id])
    @member_methodology_performance = mock_member_methodology_performance
  end
  
  private
  
  def mock_team_info
    {
      id: 1,
      name: "Équipe Paris",
      description: "Équipe commerciale région Île-de-France",
      manager_name: "Jean Dupont",
      member_count: 8,
      created_at: 1.year.ago
    }
  end
  
  def mock_team_stats
    {
      total_calls: 142,
      avg_score: 78.5,
      improvement_rate: 8.3,
      active_members: 8
    }
  end
  
  def mock_team_members
    [
      { id: 1, name: "Sophie Martin", email: "sophie.martin@example.com", calls: 30, avg_score: 81.2, trend: "up", status: "active", joined: 6.months.ago },
      { id: 2, name: "Thomas Dubois", email: "thomas.dubois@example.com", calls: 28, avg_score: 79.8, trend: "up", status: "active", joined: 8.months.ago },
      { id: 3, name: "Marie Leroy", email: "marie.leroy@example.com", calls: 25, avg_score: 77.3, trend: "stable", status: "active", joined: 5.months.ago },
      { id: 4, name: "Pierre Bernard", email: "pierre.bernard@example.com", calls: 22, avg_score: 75.1, trend: "down", status: "active", joined: 1.year.ago },
      { id: 5, name: "Julie Moreau", email: "julie.moreau@example.com", calls: 19, avg_score: 82.4, trend: "up", status: "active", joined: 4.months.ago },
      { id: 6, name: "Lucas Petit", email: "lucas.petit@example.com", calls: 12, avg_score: 68.9, trend: "up", status: "active", joined: 2.months.ago },
      { id: 7, name: "Emma Rousseau", email: "emma.rousseau@example.com", calls: 4, avg_score: 71.2, trend: "stable", status: "active", joined: 1.month.ago },
      { id: 8, name: "Hugo Garcia", email: "hugo.garcia@example.com", calls: 2, avg_score: 65.3, trend: "up", status: "active", joined: 2.weeks.ago }
    ]
  end
  
  def mock_member_detail(id)
    {
      id: id,
      name: "Sophie Martin",
      email: "sophie.martin@example.com",
      phone: "+33 6 12 34 56 78",
      team: "Équipe Paris",
      joined: 6.months.ago,
      status: "active",
      total_calls: 30,
      analyzed_calls: 24,
      avg_score: 81.2,
      improvement_rate: 12.5,
      best_methodology: "SYNTHÉON"
    }
  end
  
  def mock_member_calls(id)
    [
      { id: 1, title: "Découverte - Acme Corp", call_type: "discovery_call", methodology: "SYNTHÉON", date: 2.days.ago, score: 88.1, status: "analyzed" },
      { id: 2, title: "Cold call - TechStart", call_type: "cold_call", methodology: "CRONOS", date: 3.days.ago, score: 74.3, status: "analyzed" },
      { id: 3, title: "Négociation - Global", call_type: "negotiation_call", methodology: "FERMION", date: 5.days.ago, score: 82.0, status: "analyzed" }
    ]
  end
  
  def mock_member_methodology_performance
    {
      cronos: { score: 76.5, calls: 8, strongest_step: "Permission opener", weakest_step: "Préparation" },
      syntheon: { score: 85.2, calls: 10, strongest_step: "Questions SPIN", weakest_step: "Contrat moral" },
      fermion: { score: 79.8, calls: 6, strongest_step: "Reconnexion", weakest_step: "Discussion prix" }
    }
  end
end
