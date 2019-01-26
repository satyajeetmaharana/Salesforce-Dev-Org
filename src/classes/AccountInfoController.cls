public class AccountInfoController{
    List <Account> lstOfAccounts = new List<Account>();
    public AccountInfoController() {
        lstOfAccounts = [Select Name,No_Of_Contacts__c From Account LIMIT 5];
    }
    public List <Account> getLstOfAccounts(){
       return lstOfAccounts; 

       //test comment
    }
}