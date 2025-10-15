class Admin::AnalyticsController < MockupsController
  layout 'admin'
  
  def index
    @overview = mock_analytics_overview
    @trends = mock_platform_trends
  end
  
  def usage
    @usage_stats = mock_usage_stats
    @by_team = mock_usage_by_team
  end
  
  def performance
    @performance_metrics = mock_performance_metrics
    @api_stats = mock_api_stats
  end
  
  private
  
  def mock_analytics_overview
    {
      total_calls_this_month: 142,
      total_calls_last_month: 128,
      avg_analysis_time: 8.5,
      active_users_today: 28
    }
  end
  
  def mock_platform_trends
    [
      { date: 30.days.ago, calls: 95, users: 38 },
      { date: 25.days.ago, calls: 102, users: 39 },
      { date: 20.days.ago, calls: 118, users: 40 },
      { date: 15.days.ago, calls: 125, users: 42 },
      { date: 10.days.ago, calls: 132, users: 43 },
      { date: 5.days.ago, calls: 138, users: 44 },
      { date: Date.today, calls: 142, users: 45 }
    ]
  end
  
  def mock_usage_stats
    {
      total_uploads: 487,
      successful_analyses: 432,
      failed_analyses: 12,
      pending_analyses: 43,
      avg_file_size: 15.3,
      total_storage_gb: 7.4
    }
  end
  
  def mock_usage_by_team
    [
      { team: "Équipe Paris", calls: 142, members: 8, avg_score: 78.5 },
      { team: "Équipe Lyon", calls: 98, members: 6, avg_score: 75.2 },
      { team: "Équipe Marseille", calls: 87, members: 5, avg_score: 81.3 }
    ]
  end
  
  def mock_performance_metrics
    {
      avg_transcription_time: 4.2,
      avg_analysis_time: 8.5,
      api_uptime: 99.8,
      error_rate: 0.02
    }
  end
  
  def mock_api_stats
    {
      total_api_calls: 1247,
      successful_calls: 1234,
      failed_calls: 13,
      avg_response_time: 2.3
    }
  end
end
