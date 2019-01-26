trigger updatePhoneNumberTrigger on Contact (after insert,after update) {
    List<Contact> lstOfPrimaryContacts = new List<Contact>();
    Set<Id> setOfPrimaryContacts = new Set<Id>();
    Set<Id> setOfAccountId = new Set<Id>();
    List<Account> lstOfAccounts = new List<Account>();
    //lstOfContacts = Trigger.new;
    
    for(Contact contactRecord : Trigger.New){
        if(contactRecord.Is_Primary__c == true){
            setOfPrimaryContacts.add(contactRecord.Id);
        }
    }
    
    lstOfPrimaryContacts = [SELECT Id,Is_Primary__c,Account.Id,Phone FROM Contact WHERE Id IN :setOfPrimaryContacts];
    
    for(Contact contactRecord: lstOfPrimaryContacts){
        if(setOfAccountId.contains(contactRecord.Account.Id)){
        
        }
        else{
            setOfAccountId.add(contactRecord.Account.Id);
        }    
    }
    
    lstOfAccounts = [SELECT Id,Primary_Contact_Phone__c FROM Account WHERE Id IN :setOfAccountId];
    List<Account> lstOfAccountsToBeUpdated = new List<Account>();
    for(Account accountRecord:lstOfAccounts){
        if(accountRecord.Primary_Contact_Phone__c==null){
            for(Contact contactRecord:lstOfPrimaryContacts){
                if(contactRecord.Account.Id ==accountRecord.Id){
                    accountRecord.Primary_Contact_Phone__c = contactRecord.Phone;
                    lstOfAccountsToBeUpdated.add(accountRecord);
                }    
            }
        }
    }      
    
    update lstOfAccountsToBeUpdated; 
}