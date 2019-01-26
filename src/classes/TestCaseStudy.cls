@isTest
public class TestCaseStudy{
    public static testMethod void testNotifyMail(){
            List<Case> lstCase = new List<Case>();
            Case c = new Case();
            
            c.Subject = 'Hello From Test Method of test class';
            c.OwnerId ='00528000002h2zA';
            c.AccountId ='0012800000TRzSY';
            lstCase.add(c);            
            CaseStudy2.notifyMail(lstCase);
            
    }
}