global class OpportunityWebService{
    webService static Id createOpportunity(String oppName, Account a) {
        Opportunity opportunity = new Opportunity(Name = oppName, AccountId = a.Id);
        insert opportunity;
        return opportunity.id;
    }
}