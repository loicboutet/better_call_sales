class Admin::AppelsController < MockupsController
  layout 'admin'
  
  def index
    @calls = mock_all_calls
    @filters = { user: params[:user], team: params[:team], call_type: params[:call_type], status: params[:status] }
  end
  
  def show
    @call = mock_call_detail(params[:id])
  end
  
  def destroy
    redirect_to admin_appels_path, notice: "Appel supprimé avec succès."
  end
  
  private
  
  def mock_all_calls
    [
      { id: 1, user: "Sophie Martin", team: "Équipe Paris", title: "Découverte - Acme Corp", call_type: "discovery_call", methodology: "SYNTHÉON", date: 1.day.ago, score: 88.1, status: "analyzed" },
      { id: 2, user: "Thomas Dubois", team: "Équipe Paris", title: "Cold call - TechStart", call_type: "cold_call", methodology: "CRONOS", date: 1.day.ago, score: 76.5, status: "analyzed" },
      { id: 3, user: "Julie Moreau", team: "Équipe Paris", title: "Closing - Innovatech", call_type: "closing_call", methodology: "FERMION", date: 2.days.ago, score: 90.7, status: "analyzed" },
      { id: 4, user: "Marc Lefevre", team: "Équipe Lyon", title: "Négociation - Global", call_type: "negotiation_call", methodology: "FERMION", date: 2.days.ago, score: 82.0, status: "analyzed" },
      { id: 5, user: "Pierre Bernard", team: "Équipe Paris", title: "Découverte - StartupXYZ", call_type: "discovery_call", methodology: "SYNTHÉON", date: 3.days.ago, score: 0, status: "processing" }
    ]
  end
  
  def mock_call_detail(id)
    {
      id: id,
      user_name: "Sophie Martin",
      user_id: 1,
      team_name: "Équipe Paris",
      title: "Appel découverte - Acme Corp",
      call_type: "discovery_call",
      methodology: "SYNTHÉON",
      client_name: "Jean Dupont",
      client_company: "Acme Corp",
      date: 2.days.ago,
      duration: 1845,
      overall_score: 92.5,
      max_score: 105,
      percentage: 88.1,
      status: "analyzed",
      description: "Appel de découverte avec le directeur commercial d'Acme Corp."
    }
  end
end
