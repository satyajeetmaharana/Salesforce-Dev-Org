@isTest
public class AccountManagerTest{
    @isTest
    public static void testMEthod1(){
        Account acc = new Account(Name='testAcc');
        insert acc;
        // Set up a test request
        RestRequest request = new RestRequest();
        
        // Set request properties
        request.requestUri =
            'https://yourInstance.salesforce.com/services/apexrest/Accounts/' + acc.Id +'/contacts';
        request.httpMethod = 'GET';
        RestContext.request = request;
        
        Account acc1 = AccountManager.getAccount();
    }

}