@isTest
private class TestCaseStudy1 {
    
    static testMethod void updateContactsTest(){
    
        List<Account> lstTstAccount=new List<Account>();
        
        Account tstAccount=new Account();
        tstAccount.Name='Test';
        
        insert tstAccount;
        
        lstTstAccount.add(tstAccount);
        
        CaseStudy1.updateNoOfContacts(lstTstAccount);
    }
}