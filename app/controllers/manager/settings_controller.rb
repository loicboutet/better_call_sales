class Manager::SettingsController < MockupsController
  layout 'manager'
  
  def index
    @settings = mock_manager_settings
  end
  
  def update
    redirect_to manager_parametres_path, notice: "Paramètres mis à jour avec succès."
  end
  
  private
  
  def mock_manager_settings
    {
      notifications: {
        email_team_summary: true,
        email_member_milestone: true,
        email_low_performance_alert: true
      }
    }
  end
end
