class Admin::EquipesController < MockupsController
  layout 'admin'
  
  def index
    @teams = mock_teams_list
  end
  
  def show
    @team = mock_team_detail(params[:id])
    @members = mock_team_members(params[:id])
  end
  
  def new
    @managers = mock_available_managers
  end
  
  def create
    redirect_to admin_equipes_path, notice: "Équipe créée avec succès."
  end
  
  def edit
    @team = mock_team_detail(params[:id])
    @managers = mock_available_managers
  end
  
  def update
    redirect_to admin_equipe_path(params[:id]), notice: "Équipe mise à jour avec succès."
  end
  
  def destroy
    redirect_to admin_equipes_path, notice: "Équipe supprimée avec succès."
  end
  
  private
  
  def mock_teams_list
    [
      { id: 1, name: "Équipe Paris", manager: "Jean Dupont", members_count: 8, avg_score: 78.5, status: "active" },
      { id: 2, name: "Équipe Lyon", manager: "Marie Leroy", members_count: 6, avg_score: 75.2, status: "active" },
      { id: 3, name: "Équipe Marseille", manager: "Pierre Bernard", members_count: 5, avg_score: 81.3, status: "active" }
    ]
  end
  
  def mock_team_detail(id)
    {
      id: id,
      name: "Équipe Paris",
      description: "Équipe commerciale région Île-de-France",
      manager_id: 2,
      manager_name: "Jean Dupont",
      created_at: 1.year.ago,
      status: "active"
    }
  end
  
  def mock_team_members(id)
    [
      { id: 1, name: "Sophie Martin", email: "sophie.martin@example.com", calls: 30, avg_score: 81.2 },
      { id: 3, name: "Thomas Dubois", email: "thomas.dubois@example.com", calls: 28, avg_score: 79.8 }
    ]
  end
  
  def mock_available_managers
    [
      { id: 2, name: "Jean Dupont" },
      { id: 5, name: "Marie Leroy" },
      { id: 8, name: "Pierre Bernard" }
    ]
  end
end
