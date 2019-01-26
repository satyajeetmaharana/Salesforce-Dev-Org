public class SelfServicePortalController{
    public String userName{get;set;}
    public String userEmail{get;set;}
    
    public void createUser(){
        if(userEmail != null && userEmail.contains('sony.com')){
            List<User> lstUsers = new List<User>([SELECT Id FROM User WHERE Email =:userEmail]);
            if(lstUsers != null && lstUsers.size() > 0){
                ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR,'Error: Sorry. A user with this email already exists.');
                ApexPages.addMessage(myMsg);
            }    
        }
    }
}