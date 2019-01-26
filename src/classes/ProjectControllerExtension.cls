public class ProjectControllerExtension{

    public final Project_Selection__c projSel;
    
    public String project { get; set; }
    public String status {get; set;}
    
    public ProjectControllerExtension(ApexPages.StandardController stdController ){
        this.projSel = (Project_Selection__c)stdController.getRecord();
        
    }
    
    
    
    public PageReference saveProject(){
        
        insert projSel;
        PageReference redirectPage = new PageReference('https://ap2.salesforce.com/' + projSel.Id) ;
        return redirectPage;
    }
}