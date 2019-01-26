public class MyOpportunitiesController{
    public List<Opportunity> opportunityList;
    public List<Opportunity> getOpportunityList(){
        if(opportunityList==null){
            opportunityList = new List<Opportunity>();
        }
        opportunityList = Database.query('SELECT Id,Name,StageName,Account.Name,CloseDate,Probability FROM Opportunity WHERE StageName =:stageName');
        return opportunityList;
    }
    public String stageName{
        get{
            if(stageName ==null) { stageName = 'Qualification';}
            return stageName;
        }
        set;
    }    
    public List<SelectOption> getStageNames(){
        List<SelectOption> options = new List<SelectOption>();
        options.add(new SelectOption('Qualification','Qualification'));
        options.add(new SelectOption('Closed Won','Closed Won'));
        options.add(new SelectOption('Closed Lost','Closed Lost'));
        options.add(new SelectOption('Negotiation/Review','Negotiation/Review'));
        return options;
    
    }
}