class Admin::CriteresController < MockupsController
  layout 'admin'
  
  def index
    @criteria_by_methodology = mock_criteria_by_methodology
  end
  
  def show
    @criterion = mock_criterion_detail(params[:id])
  end
  
  def new
    @methodologies = mock_methodologies
  end
  
  def create
    redirect_to admin_criteres_path, notice: "Critère créé avec succès."
  end
  
  def edit
    @criterion = mock_criterion_detail(params[:id])
    @methodologies = mock_methodologies
  end
  
  def update
    redirect_to admin_critere_path(params[:id]), notice: "Critère mis à jour avec succès."
  end
  
  def destroy
    redirect_to admin_criteres_path, notice: "Critère supprimé avec succès."
  end
  
  def reorder
    redirect_to admin_criteres_path, notice: "Ordre des critères mis à jour."
  end
  
  private
  
  def mock_methodologies
    [
      { value: "cronos", label: "CRONOS (Appel à froid)", steps: 7 },
      { value: "syntheon", label: "SYNTHÉON (Découverte & Soutenance)", steps: "7-9" },
      { value: "fermion", label: "FERMION (Négociation & Closing)", steps: 5 }
    ]
  end
  
  def mock_criteria_by_methodology
    {
      cronos: [
        { id: 1, step: "Préparation", position: 1, criteria_count: 5, is_active: true },
        { id: 2, step: "Permission opener", position: 2, criteria_count: 5, is_active: true },
        { id: 3, step: "Valeur chiffrée", position: 3, criteria_count: 5, is_active: true },
        { id: 4, step: "Micro-qualification", position: 4, criteria_count: 5, is_active: true },
        { id: 5, step: "Objection réflexe", position: 5, criteria_count: 5, is_active: true },
        { id: 6, step: "CTA calendrier", position: 6, criteria_count: 5, is_active: true },
        { id: 7, step: "Confirmation live", position: 7, criteria_count: 5, is_active: true }
      ],
      syntheon: [
        { id: 8, step: "Ice-breaker", position: 1, criteria_count: 5, is_active: true },
        { id: 9, step: "Contrat moral", position: 2, criteria_count: 5, is_active: true },
        { id: 10, step: "Grille BEBEDC/MEDDIC", position: 3, criteria_count: 5, is_active: true },
        { id: 11, step: "Questions SPIN", position: 4, criteria_count: 5, is_active: true },
        { id: 12, step: "Écoute active", position: 5, criteria_count: 5, is_active: true },
        { id: 13, step: "Synthèse & Vision", position: 6, criteria_count: 5, is_active: true },
        { id: 14, step: "Plan d'action", position: 7, criteria_count: 5, is_active: true }
      ],
      fermion: [
        { id: 15, step: "Reconnexion", position: 1, criteria_count: 5, is_active: true },
        { id: 16, step: "Objections ouvertes", position: 2, criteria_count: 5, is_active: true },
        { id: 17, step: "Discussion prix", position: 3, criteria_count: 5, is_active: true },
        { id: 18, step: "Legal & Procurement", position: 4, criteria_count: 5, is_active: true },
        { id: 19, step: "Accord verbal", position: 5, criteria_count: 5, is_active: true }
      ]
    }
  end
  
  def mock_criterion_detail(id)
    {
      id: id,
      step_name: "Ice-breaker",
      methodology: "syntheon",
      position: 1,
      is_active: true,
      criteria: [
        { name: "Rappel du contexte initial", description: "Origine du contact et interlocuteurs clés clairement cités" },
        { name: "Objectif stratégique concret", description: "Formulation explicite de l'intention business" },
        { name: "Enjeu métier opérationnel", description: "Identification claire du problème ou objectif" },
        { name: "Agenda concis et validé", description: "Présentation brève, accord immédiat" },
        { name: "Climat professionnel et équilibré", description: "Posture crédible, relation d'égal à égal" }
      ],
      posture_expected: "Crédible, collaborative",
      evaluation_prompt: "Analyse ce call en te concentrant uniquement sur l'étape Ice-breaker..."
    }
  end
end
