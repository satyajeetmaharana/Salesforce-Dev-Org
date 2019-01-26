trigger updateTrigger on Contact (after insert,after delete) {
    
    Set<Id> aId = new Set<Id>();
    
    Contact[] contacts;
    
    if(Trigger.isInsert){
        contacts = Trigger.new;
    }
    else{
        contacts = Trigger.old;
    }
    for(Contact c : contacts){
        aId.add(c.AccountId);
    }
    
    List<Account> acc = [select id,No_of_Contacts__c from Account where Id in:aId];
    

        CaseStudy1.updateNoOfContacts(acc);


}