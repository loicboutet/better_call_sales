class Commercial::AppelsController < MockupsController
  layout 'commercial'
  
  def index
    @calls = mock_calls_list
    @filters = { call_type: params[:call_type], status: params[:status] }
  end
  
  def show
    @call = mock_call_detail(params[:id])
  end
  
  def new
    @call_types = call_types_options
  end
  
  def create
    redirect_to mockups_commercial_appels_path, notice: "Appel téléchargé avec succès. L'analyse démarrera sous peu."
  end
  
  def edit
    @call = mock_call_detail(params[:id])
    @call_types = call_types_options
  end
  
  def update
    redirect_to mockups_commercial_appel_path(params[:id]), notice: "Appel mis à jour avec succès."
  end
  
  def destroy
    redirect_to mockups_commercial_appels_path, notice: "Appel supprimé avec succès."
  end
  
  def analyse
    @call = mock_call_detail(params[:id])
    @analysis = mock_detailed_analysis(params[:id])
  end
  
  def transcription
    @call = mock_call_detail(params[:id])
    @transcription = mock_transcription(params[:id])
  end
  
  private
  
  def call_types_options
    [
      { value: "cold_call", label: "Appel à froid (CRONOS - 7 étapes)", methodology: "CRONOS" },
      { value: "discovery_call", label: "Appel découverte (SYNTHÉON - 7 étapes)", methodology: "SYNTHÉON" },
      { value: "negotiation_call", label: "Appel négociation (FERMION - 5 étapes)", methodology: "FERMION" },
      { value: "closing_call", label: "Appel closing (FERMION - 5 étapes)", methodology: "FERMION" },
      { value: "rfp_call", label: "Soutenance AO (SYNTHÉON - 9 étapes)", methodology: "SYNTHÉON" }
    ]
  end
  
  def mock_calls_list
    [
      {
        id: 1,
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
        status: "analyzed"
      },
      {
        id: 2,
        title: "Appel à froid - TechStart",
        call_type: "cold_call",
        methodology: "CRONOS",
        client_name: "Marie Martin",
        client_company: "TechStart",
        date: 3.days.ago,
        duration: 420,
        overall_score: 78.0,
        max_score: 105,
        percentage: 74.3,
        status: "analyzed"
      },
      {
        id: 3,
        title: "Négociation - Global Industries",
        call_type: "negotiation_call",
        methodology: "FERMION",
        client_name: "Pierre Dubois",
        client_company: "Global Industries",
        date: 5.days.ago,
        duration: 2100,
        overall_score: 61.5,
        max_score: 75,
        percentage: 82.0,
        status: "analyzed"
      },
      {
        id: 4,
        title: "Closing - Innovatech",
        call_type: "closing_call",
        methodology: "FERMION",
        client_name: "Sophie Bernard",
        client_company: "Innovatech",
        date: 1.week.ago,
        duration: 1320,
        overall_score: 68.0,
        max_score: 75,
        percentage: 90.7,
        status: "analyzed"
      },
      {
        id: 5,
        title: "Appel à froid - StartupXYZ",
        call_type: "cold_call",
        methodology: "CRONOS",
        client_name: "Marc Leroy",
        client_company: "StartupXYZ",
        date: 1.week.ago,
        duration: 360,
        overall_score: 0,
        max_score: 105,
        percentage: 0,
        status: "processing"
      }
    ]
  end
  
  def mock_call_detail(id)
    {
      id: id,
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
      description: "Appel de découverte avec le directeur commercial d'Acme Corp pour comprendre leurs besoins en automatisation.",
      recording_url: "#"
    }
  end
  
  def mock_detailed_analysis(id)
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
            {
              name: "Rappel du contexte initial",
              score: 3,
              justification: "Le commercial a parfaitement rappelé l'origine du contact et les interlocuteurs clés mentionnés lors de l'appel à froid."
            },
            {
              name: "Objectif stratégique concret",
              score: 3,
              justification: "L'objectif de l'appel a été clairement formulé : comprendre les enjeux d'automatisation et qualifier l'opportunité."
            },
            {
              name: "Enjeu métier opérationnel",
              score: 3,
              justification: "L'enjeu business a été immédiatement identifié et positionné : gain de temps sur les tâches répétitives."
            },
            {
              name: "Agenda concis et validé",
              score: 3,
              justification: "Agenda présenté en moins de 30 secondes avec validation explicite du prospect."
            },
            {
              name: "Climat professionnel et équilibré",
              score: 3,
              justification: "Ton professionnel, posture d'égal à égal parfaitement établie dès l'ouverture."
            }
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
            {
              name: "Durée précisée si nécessaire",
              score: 2,
              justification: "La durée a été mentionnée mais de manière imprécise ('environ 30 minutes')."
            },
            {
              name: "Objectifs concrets",
              score: 2,
              justification: "Les objectifs étaient présents mais auraient pu être plus opérationnels."
            },
            {
              name: "Proposition d'enregistrement",
              score: 1,
              justification: "L'enregistrement n'a pas été proposé, ce qui aurait pu renforcer le cadre professionnel."
            },
            {
              name: "Plan de secours",
              score: 2,
              justification: "Un plan B technique a été mentionné mais pourrait être plus structuré."
            },
            {
              name: "Cadre clair et engageant",
              score: 3,
              justification: "Le cadre général était clair et a permis un échange fluide."
            }
          ],
          recommendations: [
            "Systématiquement proposer l'enregistrement de l'appel pour les appels découverte",
            "Préciser davantage la durée prévue pour permettre au prospect de mieux s'organiser"
          ]
        },
        {
          position: 3,
          name: "Grille BEBEDC/MEDDIC",
          score: 13.0,
          max_score: 15,
          percentage: 86.7,
          performance_level: "optimal",
          posture_expected: "Structurée, investigatrice",
          posture_observed: "Très bonne structure de questionnement",
          criteria: [
            {
              name: "Budget",
              score: 3,
              justification: "Budget clairement identifié et qualifié : 50-75K€ disponibles."
            },
            {
              name: "Enjeux",
              score: 3,
              justification: "Enjeux stratégiques parfaitement compris : automatisation pour libérer du temps commercial."
            },
            {
              name: "Besoin",
              score: 3,
              justification: "Besoin caractérisé avec précision : CRM + automatisation des tâches répétitives."
            },
            {
              name: "Échéances",
              score: 2,
              justification: "Timeline identifiée (fin de trimestre) mais contraintes temporelles non approfondies."
            },
            {
              name: "Décideur",
              score: 2,
              justification: "Décideur identifié (Jean Dupont) mais processus de validation avec CFO à clarifier."
            }
          ],
          recommendations: [
            "Creuser davantage les contraintes temporelles et les jalons internes du client",
            "Cartographier plus précisément le processus de décision et les influenceurs clés"
          ]
        },
        {
          position: 4,
          name: "Questions SPIN",
          score: 15.0,
          max_score: 15,
          percentage: 100.0,
          performance_level: "optimal",
          posture_expected: "Consultative, curieuse",
          posture_observed: "Posture consultative exemplaire",
          criteria: [
            {
              name: "Questions de Situation",
              score: 3,
              justification: "Contexte actuel parfaitement compris avec questions pertinentes sur l'organisation et les outils."
            },
            {
              name: "Questions de Problème",
              score: 3,
              justification: "Difficultés identifiées avec précision : perte de temps, erreurs de saisie, manque de visibilité."
            },
            {
              name: "Questions d'Implication",
              score: 3,
              justification: "Impact des problèmes quantifié : 20% du temps commercial perdu, baisse de motivation équipe."
            },
            {
              name: "Questions Need-payoff",
              score: 3,
              justification: "Bénéfices de la solution co-construits avec le prospect de manière très naturelle."
            },
            {
              name: "Progression logique",
              score: 3,
              justification: "Enchaînement parfait des questions avec transitions fluides et naturelles."
            }
          ],
          recommendations: [
            "Continuer à utiliser cette approche SPIN pour tous les appels découverte",
            "Partager cette bonne pratique avec l'équipe commerciale"
          ]
        },
        {
          position: 5,
          name: "Écoute active",
          score: 14.0,
          max_score: 15,
          percentage: 93.3,
          performance_level: "optimal",
          posture_expected: "Attentive, empathique",
          posture_observed: "Excellente écoute et reformulation",
          criteria: [
            {
              name: "Silence après questions",
              score: 3,
              justification: "Blancs de 3-4 secondes systématiquement respectés après chaque question clé."
            },
            {
              name: "Reformulation systématique",
              score: 3,
              justification: "Reformulation présente à chaque point clé pour valider la compréhension."
            },
            {
              name: "Observation des signaux",
              score: 3,
              justification: "Adaptation au ton et aux hésitations du prospect remarquée."
            },
            {
              name: "Approfondissement pertinent",
              score: 2,
              justification: "Questions de suivi pertinentes mais une opportunité d'approfondissement manquée sur le budget."
            },
            {
              name: "Ratio écoute/parole",
              score: 3,
              justification: "Excellent ratio : le prospect a parlé environ 65% du temps."
            }
          ],
          recommendations: [
            "Creuser systématiquement lorsqu'une information importante est mentionnée rapidement",
            "Maintenir ce niveau d'écoute active qui est une vraie force"
          ]
        },
        {
          position: 6,
          name: "Synthèse & Vision",
          score: 14.0,
          max_score: 15,
          percentage: 93.3,
          performance_level: "optimal",
          posture_expected: "Synthétique, alignée",
          posture_observed: "Synthèse claire et validation obtenue",
          criteria: [
            {
              name: "Reformulation complète",
              score: 3,
              justification: "Tous les enjeux clés ont été résumés de manière structurée et concise."
            },
            {
              name: "Validation du prospect",
              score: 3,
              justification: "Validation explicite obtenue : 'Oui, c'est exactement ça'."
            },
            {
              name: "Lien solution-besoin",
              score: 3,
              justification: "Connexion claire entre la solution et les besoins identifiés."
            },
            {
              name: "Gestion des écarts",
              score: 2,
              justification: "Un point mineur (intégration comptabilité) non repris dans la synthèse."
            },
            {
              name: "Transition vers next steps",
              score: 3,
              justification: "Transition naturelle et fluide vers les prochaines étapes."
            }
          ],
          recommendations: [
            "S'assurer de reprendre tous les points mentionnés, même ceux qui semblent secondaires",
            "Continuer cette pratique de synthèse structurée qui est excellente"
          ]
        },
        {
          position: 7,
          name: "Plan d'action & Next steps",
          score: 11.0,
          max_score: 15,
          percentage: 73.3,
          performance_level: "good",
          posture_expected: "Organisée, proactive",
          posture_observed: "Proactif mais manque de précision",
          criteria: [
            {
              name: "Jalons précis",
              score: 2,
              justification: "Étapes mentionnées mais dates imprécises ('semaine prochaine', 'début de semaine')."
            },
            {
              name: "Ressources identifiées",
              score: 2,
              justification: "Ressources côté client mentionnées mais non détaillées (qui, quand, combien de temps)."
            },
            {
              name: "Prochain RDV fixé",
              score: 2,
              justification: "RDV évoqué mais pas fixé avec date et heure précise pendant l'appel."
            },
            {
              name: "Validation mutuelle",
              score: 3,
              justification: "Accord obtenu sur le plan global malgré le manque de précision."
            },
            {
              name: "Documentation",
              score: 2,
              justification: "Envoi de synthèse promis mais timing non précisé."
            }
          ],
          recommendations: [
            "Fixer systématiquement le prochain RDV avec date et heure précises pendant l'appel",
            "Donner des dates précises pour toutes les étapes du plan d'action (J+1, J+3, etc.)"
          ]
        }
      ]
    }
  end
  
  def mock_transcription(id)
    {
      full_text: "Transcription complète de l'appel...",
      language: "fr",
      confidence: 0.94,
      segments: [
        {
          speaker: "Commercial",
          text: "Bonjour Jean, merci de prendre le temps pour cet échange. Je vous appelle suite à notre conversation de la semaine dernière où vous m'aviez mentionné vos enjeux d'automatisation.",
          start_time: 0.0,
          end_time: 8.5,
          confidence: 0.96
        },
        {
          speaker: "Client",
          text: "Oui bonjour, tout à fait. Alors effectivement on cherche à améliorer notre efficacité commerciale.",
          start_time: 9.0,
          end_time: 14.2,
          confidence: 0.93
        },
        {
          speaker: "Commercial",
          text: "Parfait. Donc si je comprends bien, l'objectif de notre échange aujourd'hui c'est de comprendre précisément vos enjeux d'automatisation et de voir comment on pourrait vous accompagner. Je vous propose qu'on prenne environ 30 minutes, ça vous convient ?",
          start_time: 14.8,
          end_time: 26.5,
          confidence: 0.95
        },
        {
          speaker: "Client",
          text: "Oui c'est parfait pour moi.",
          start_time: 27.0,
          end_time: 28.5,
          confidence: 0.97
        },
        {
          speaker: "Commercial",
          text: "Excellent. Donc pour commencer, est-ce que vous pouvez me parler un peu de votre organisation commerciale actuelle ?",
          start_time: 29.0,
          end_time: 34.8,
          confidence: 0.94
        }
      ]
    }
  end
end
