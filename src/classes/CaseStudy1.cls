public class CaseStudy1{
    public static void updateNoOfContacts(List<Account> lstAccount){
    
        List<Account> lstAccountToBeUpdated=new List<Account>();
        
        Set<Id> setAccountIds=new Set<Id>();
        
        for(Account account:lstAccount){
               setAccountIds.add(account.Id);
        }
        
        List<Contact> lstContact=[Select Id,AccountId From Contact Where AccountId IN:setAccountIds];
        
        for(Account account:lstAccount){
            account.No_of_Contacts__c=lstContact.size();
            lstAccountToBeUpdated.add(account);
        }
        
        Database.update(lstAccountToBeUpdated);
    }
}