class Admin::SettingsController < MockupsController
  layout 'admin'
  
  def index
    @settings = mock_platform_settings
  end
  
  def update
    redirect_to admin_parametres_path, notice: "Paramètres mis à jour avec succès."
  end
  
  def api
    @api_settings = mock_api_settings
  end
  
  def update_api
    redirect_to admin_parametres_api_path, notice: "Configuration API mise à jour avec succès."
  end
  
  private
  
  def mock_platform_settings
    {
      platform_name: "WeSales",
      max_file_size: 100
    }
  end
  
  def mock_api_settings
    {
      transcription_provider: "eleven_labs",
      api_key: "sk_••••••••••••••••",
      endpoint: "https://api.elevenlabs.io/v1",
      timeout: 30
    }
  end
end
