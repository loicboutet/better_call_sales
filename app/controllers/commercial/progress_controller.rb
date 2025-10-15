class Commercial::ProgressController < MockupsController
  layout 'commercial'
  
  def index
    @progress_data = mock_progress_data
    @methodology_trends = mock_methodology_trends
    @step_performance = mock_step_performance
  end
  
  private
  
  def mock_progress_data
    {
      overall_evolution: [
        { date: 30.days.ago, score: 68.5 },
        { date: 25.days.ago, score: 71.2 },
        { date: 20.days.ago, score: 74.8 },
        { date: 15.days.ago, score: 77.3 },
        { date: 10.days.ago, score: 79.1 },
        { date: 5.days.ago, score: 81.5 },
        { date: Date.today, score: 83.2 }
      ],
      by_call_type: {
        cold_call: { current: 76.5, previous: 71.2, trend: "up", calls_count: 8 },
        discovery_call: { current: 85.2, previous: 78.9, trend: "up", calls_count: 10 },
        negotiation_call: { current: 79.8, previous: 81.1, trend: "down", calls_count: 6 },
        closing_call: { current: 87.3, previous: 85.0, trend: "up", calls_count: 4 },
        rfp_call: { current: 82.1, previous: 79.5, trend: "up", calls_count: 2 }
      }
    }
  end
  
  def mock_methodology_trends
    [
      {
        methodology: "CRONOS",
        call_types: ["Appel à froid"],
        current_score: 76.5,
        max_score: 105,
        percentage: 72.9,
        evolution: "+5.3 points",
        strongest_steps: ["Permission opener", "Valeur chiffrée"],
        weakest_steps: ["Préparation", "CTA calendrier"]
      },
      {
        methodology: "SYNTHÉON",
        call_types: ["Appel découverte", "Soutenance AO"],
        current_score: 84.7,
        max_score: 105,
        percentage: 80.7,
        evolution: "+6.3 points",
        strongest_steps: ["Questions SPIN", "Écoute active"],
        weakest_steps: ["Contrat moral", "Plan d'action"]
      },
      {
        methodology: "FERMION",
        call_types: ["Négociation", "Closing"],
        current_score: 83.6,
        max_score: 75,
        percentage: 111.5,
        evolution: "+1.4 points",
        strongest_steps: ["Reconnexion", "Accord verbal"],
        weakest_steps: ["Discussion prix"]
      }
    ]
  end
  
  def mock_step_performance
    {
      consistently_strong: [
        { step: "Questions SPIN (SYNTHÉON)", avg_score: 14.2, trend: "stable" },
        { step: "Écoute active (SYNTHÉON)", avg_score: 13.8, trend: "up" },
        { step: "Ice-breaker (SYNTHÉON)", avg_score: 13.5, trend: "up" }
      ],
      needs_focus: [
        { step: "Préparation (CRONOS)", avg_score: 9.8, trend: "stable" },
        { step: "Contrat moral (SYNTHÉON)", avg_score: 10.2, trend: "down" },
        { step: "Discussion prix (FERMION)", avg_score: 10.5, trend: "stable" }
      ],
      most_improved: [
        { step: "Permission opener (CRONOS)", improvement: "+2.8 points", from: 10.2, to: 13.0 },
        { step: "Grille BEBEDC (SYNTHÉON)", improvement: "+2.3 points", from: 11.0, to: 13.3 },
        { step: "Objections ouvertes (FERMION)", improvement: "+1.9 points", from: 11.1, to: 13.0 }
      ]
    }
  end
end
