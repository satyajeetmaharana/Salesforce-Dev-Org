public class UserRegistrationPageController {
    public WebsiteUser__c newUser{get;set;}
    public UserRegistrationPageController(){
        newUser = new WebsiteUser__c();
        
    }
    public PageReference createUser(){
        
        try{
            newUser.Active__c = true;
            insert newUser;
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.CONFIRM,'Login Successful. An email has been sent to your email Id. Kindly login'));
            return new PageReference('/apex/loginpage?newUser=1');
        }
        catch(Exception ex){
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR,ex.getMessage()));
            return null;
        }
    }
}