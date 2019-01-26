public class WrapperDemoController{
    List <WrapAccount> lstOfAccounts;
    
    public List <WrapAccount> getLAccounts() {
       if(lstOfAccounts == null) {
            lstOfAccounts = new List<WrapAccount>();
       }
       List<Account> lstOfAllAccounts = new List<Account>(); 
       lstOfAllAccounts = [Select Name From Account LIMIT 10]; 
       System.debug('Size of all accounts from Database : ' + lstOfAllAccounts.size());
       System.debug('List of ALL accounts :' + lstOfAllAccounts);
       for(Account accountDb : lstOfAllAccounts){  
           lstOfAccounts.add(new WrapAccount(accountDb));
       }
       System.debug('Size of account list passed to VF : ' + lstOfAccounts.size());
       System.debug('List of all accounts passed to VF Page: ' + lstOfAccounts);
       return lstOfAccounts;
    }
    public class WrapAccount{
        public Account accountWrap{ get; set; }
        public Boolean selected { get; set; }
        public WrapAccount(Account account){
            selected = false;
            accountWrap = account;
        }
    }
    
    public WrapperDemoController(){
    }
    
    public PageReference deleteAccounts(){
        List <Account> lstToBeDeleted = new List<Account>();
        for(WrapAccount account:getLAccounts()){
            if(account.selected == true){
                lstToBeDeleted.add(account.accountWrap);
            }
        }
        for(Account accountToBeDeleted : lstToBeDeleted){
            delete accountToBeDeleted;
        }
        lstOfAccounts = null;
        return null;
    }
}