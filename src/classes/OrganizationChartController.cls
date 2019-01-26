public class OrganizationChartController
{
    List<Account> lstAllAccounts;
    public static Map<Id,List<Account>> mapParentAccountIdToAccount;
    
    public List<Account> lstTopLevelAccounts{get;set;}
    
    public String clickedAccountId {get;set;}
    public List<Account> lstOfClickedChildAccounts{get;set;}
    
    public OrganizationChartController()
    {
        lstAllAccounts = new List<Account>([SELECT Id,Name, ParentId FROM Account]);
        mapParentAccountIdToAccount = new Map<Id,List<Account>>();
        
        lstTopLevelAccounts = new List<Account>();
        
        for(Account account : lstAllAccounts)
        {
            if(account.ParentId == null)
                lstTopLevelAccounts.add(account);
            else
            {
                List<Account> lstChildAccounts = mapParentAccountIdToAccount.get(account.ParentId);
                
                if(lstChildAccounts == null)
                    lstChildAccounts = new List<Account>();
                lstChildAccounts.add(account);
                mapParentAccountIdToAccount.put(account.ParentId,lstChildAccounts);
            }       
        }
    }
    
    public List<Account> getChildAccounts()
    {
        List<Account> lstChildAccounts = new List<Account>();
        if(String.isNotBlank(clickedAccountId) && mapParentAccountIdToAccount != null && mapParentAccountIdToAccount.containsKey(clickedAccountId) && mapParentAccountIdToAccount.get(clickedAccountId) != null)
        {
            lstChildAccounts = mapParentAccountIdToAccount.get(clickedAccountId);
        }
        return lstChildAccounts;
    }   
}