class Commercial::SettingsController < MockupsController
  layout 'commercial'
  
  def index
    @settings = mock_user_settings
  end
  
  def update
    redirect_to commercial_parametres_path, notice: "Paramètres mis à jour avec succès."
  end
  
  private
  
  def mock_user_settings
    {
      notifications: {
        email_on_analysis_complete: true,
        email_on_new_recommendation: true,
        email_weekly_summary: true
      }
    }
  end
end
