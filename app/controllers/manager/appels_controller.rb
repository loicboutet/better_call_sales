class Manager::AppelsController < MockupsController
  layout 'manager'
  
  def index
    @calls = mock_team_calls_list
    @filters = { member: params[:member], call_type: params[:call_type], status: params[:status] }
    @team_members = mock_team_members_for_filter
  end
  
  def show
    @call = mock_call_detail(params[:id])
    @analysis = mock_call_analysis(params[:id])
  end
  
  def analyse
    @call = mock_call_detail(params[:id])
    @analysis = mock_detailed_analysis(params[:id])
  end
  
  private
  
  def mock_team_members_for_filter
    [
      { id: 1, name: "Sophie Martin" },
      { id: 2, name: "Thomas Dubois" },
      { id: 3, name: "Marie Leroy" },
      { id: 4, name: "Pierre Bernard" },
      { id: 5, name: "Julie Moreau" }
    ]
  end
  
  def mock_team_calls_list
    [
      { id: 1, member_id: 1, member_name: "Sophie Martin", title: "Découverte - Acme Corp", call_type: "discovery_call", methodology: "SYNTHÉON", client: "Jean Dupont - Acme Corp", date: 1.day.ago, duration: 1845, score: 88.1, max_score: 105, status: "analyzed" },
      { id: 2, member_id: 2, member_name: "Thomas Dubois", title: "Cold call - TechStart", call_type: "cold_call", methodology: "CRONOS", client: "Marie Martin - TechStart", date: 1.day.ago, duration: 420, score: 76.5, max_score: 105, status: "analyzed" },
      { id: 3, member_id: 5, member_name: "Julie Moreau", title: "Closing - Innovatech", call_type: "closing_call", methodology: "FERMION", client: "Sophie Bernard - Innovatech", date: 2.days.ago, duration: 1320, score: 90.7, max_score: 75, status: "analyzed" },
      { id: 4, member_id: 3, member_name: "Marie Leroy", title: "Négociation - Global Industries", call_type: "negotiation_call", methodology: "FERMION", client: "Pierre Dubois - Global", date: 2.days.ago, duration: 2100, score: 82.0, max_score: 75, status: "analyzed" },
      { id: 5, member_id: 4, member_name: "Pierre Bernard", title: "Découverte - StartupXYZ", call_type: "discovery_call", methodology: "SYNTHÉON", client: "Marc Leroy - StartupXYZ", date: 3.days.ago, duration: 0, score: 0, max_score: 105, status: "processing" }
    ]
  end
  
  def mock_call_detail(id)
    {
      id: id,
      member_name: "Sophie Martin",
      member_id: 1,
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
  
  def mock_call_analysis(id)
    {
      overall_score: 92.5,
      max_score: 105,
      percentage: 88.1,
      performance_level: "excellent",
      summary: "Excellent appel de découverte avec une très bonne maîtrise de la méthodologie SYNTHÉON.",
      strengths: ["Ice-breaker très bien maîtrisé (15/15)", "Écoute active excellente (14/15)", "Questions SPIN parfaitement exécutées (15/15)"],
      areas_for_improvement: ["Contrat moral perfectible (10/15)", "Plan d'action pourrait être plus précis (11/15)"]
    }
  end
  
  def mock_detailed_analysis(id)
    # Reuse the same detailed analysis from Commercial controller
    {
      overall_score: 92.5,
      max_score: 105,
      percentage: 88.1,
      performance_level: "excellent",
      summary: "Excellent appel de découverte avec une très bonne maîtrise de la méthodologie SYNTHÉON. Le commercial a démontré une excellente écoute active et a su poser les bonnes questions pour comprendre les enjeux du client.",
      key_points: [
        "Besoin identifié : Automatisation des processus commerciaux",
        "Budget disponible : 50-75K€",
        "Timeline : Décision avant fin du trimestre",
        "Décideur : Jean Dupont (Directeur Commercial) avec validation CFO"
      ],
      action_items: [
        "Envoyer la proposition commerciale avant vendredi",
        "Organiser une démo produit la semaine prochaine",
        "Préparer les cas clients du secteur industrie"
      ],
      strengths: [
        "Ice-breaker très bien maîtrisé (15/15)",
        "Écoute active excellente (14/15)",
        "Questions SPIN parfaitement exécutées (15/15)"
      ],
      areas_for_improvement: [
        "Contrat moral perfectible (10/15)",
        "Plan d'action pourrait être plus précis (11/15)"
      ],
      methodology_steps: [
        {
          position: 1,
          name: "Ice-breaker",
          score: 15.0,
          max_score: 15,
          percentage: 100.0,
          performance_level: "optimal",
          posture_expected: "Crédible, collaborative",
          posture_observed: "Excellent alignement avec la posture attendue",
          criteria: [
            { name: "Rappel du contexte initial", score: 3, justification: "Le commercial a parfaitement rappelé l'origine du contact et les interlocuteurs clés mentionnés lors de l'appel à froid." },
            { name: "Objectif stratégique concret", score: 3, justification: "L'objectif de l'appel a été clairement formulé : comprendre les enjeux d'automatisation et qualifier l'opportunité." },
            { name: "Enjeu métier opérationnel", score: 3, justification: "L'enjeu business a été immédiatement identifié et positionné : gain de temps sur les tâches répétitives." },
            { name: "Agenda concis et validé", score: 3, justification: "Agenda présenté en moins de 30 secondes avec validation explicite du prospect." },
            { name: "Climat professionnel et équilibré", score: 3, justification: "Ton professionnel, posture d'égal à égal parfaitement établie dès l'ouverture." }
          ],
          recommendations: [
            "Maintenir cette excellence dans l'ice-breaker pour tous les appels",
            "Utiliser ce modèle comme référence pour former d'autres commerciaux"
          ]
        },
        {
          position: 2,
          name: "Contrat moral",
          score: 10.0,
          max_score: 15,
          percentage: 66.7,
          performance_level: "partial",
          posture_expected: "Professionnelle, rassurante",
          posture_observed: "Posture correcte mais manque de structure",
          criteria: [
            { name: "Durée précisée si nécessaire", score: 2, justification: "La durée a été mentionnée mais de manière imprécise ('environ 30 minutes')." },
            { name: "Objectifs concrets", score: 2, justification: "Les objectifs étaient présents mais auraient pu être plus opérationnels." },
            { name: "Proposition d'enregistrement", score: 1, justification: "L'enregistrement n'a pas été proposé, ce qui aurait pu renforcer le cadre professionnel." },
            { name: "Plan de secours", score: 2, justification: "Un plan B technique a été mentionné mais pourrait être plus structuré." },
            { name: "Cadre clair et engageant", score: 3, justification: "Le cadre général était clair et a permis un échange fluide." }
          ],
          recommendations: [
            "Systématiquement proposer l'enregistrement de l'appel pour les appels découverte",
            "Préciser davantage la durée prévue pour permettre au prospect de mieux s'organiser"
          ]
        }
      ]
    }
  end
end
