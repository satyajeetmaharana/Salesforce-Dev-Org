trigger AccountTrigger on Account (after update) {
    Set<Id> setAccIds = new Set<Id>();
    for(Account acc:Trigger.New){
        if(acc.IsActive__c != trigger.oldMap.get(acc.Id).IsActive__c && acc.IsActive__c){
            setAccIds.add(acc.Id);
        }
    }
    List<Contact> lstCon = new List<Contact>([SELECT Id FROM Contact WHERE AccountId IN :setAccIds]);
    
    delete lstCon;
}