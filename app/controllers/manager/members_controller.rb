class Manager::MembersController < MockupsController
  layout 'manager'
  
  def calls
    @member = mock_member_info(params[:id])
    @calls = mock_member_calls(params[:id])
  end
  
  private
  
  def mock_member_info(id)
    {
      id: id,
      name: "Sophie Martin",
      email: "sophie.martin@example.com"
    }
  end
  
  def mock_member_calls(id)
    [
      { id: 1, title: "Découverte - Acme Corp", call_type: "discovery_call", methodology: "SYNTHÉON", date: 2.days.ago, score: 88.1, max_score: 105, status: "analyzed" },
      { id: 2, title: "Cold call - TechStart", call_type: "cold_call", methodology: "CRONOS", date: 3.days.ago, score: 74.3, max_score: 105, status: "analyzed" },
      { id: 3, title: "Négociation - Global", call_type: "negotiation_call", methodology: "FERMION", date: 5.days.ago, score: 82.0, max_score: 75, status: "analyzed" },
      { id: 4, title: "Closing - Innovatech", call_type: "closing_call", methodology: "FERMION", date: 1.week.ago, score: 90.7, max_score: 75, status: "analyzed" }
    ]
  end
end
