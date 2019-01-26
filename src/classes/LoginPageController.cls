public class LoginPageController{
    public String userName{get;set;}
    public String password{get;set;}
    public LoginPageController(){
        userName = '';
        password = '';
        if(ApexPages.currentPage().getParameters().get('newUser') == '1'){
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.CONFIRM,'User Successfully created. Kindly login'));
        }
    }
    
    
    public void login(){
        List<WebsiteUser__c> lstWebsiteUsers = new List<WebsiteUser__c>([SELECT Id,Password__c FROM WebsiteUser__c Where (Username__c = :userName OR Email__c =:userName) AND Active__c = true]);
        if(lstWebsiteUsers.size() >0){
            if(lstWebsiteUsers[0].Password__c.equals(password)){
                ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.CONFIRM,'Login Successful.'));
            }
            else{
                ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR,'Incorrect password'));
            }
        }
        else{
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.WARNING,'No User with the user name - \'' + username + '\' found.'));
        }
    }
    
    public PageReference newUserRedirect(){
        PageReference pageRef = new PageReference('/apex/UserRegistrationPage');
        return pageRef;
    }
}