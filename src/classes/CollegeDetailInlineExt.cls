public class CollegeDetailInlineExt{
    public Account College{get;set;}
    public Boolean EditMode{get;set;}
    public CollegeApplication__c collegeApp{get;set;}
    public CollegeDetailInlineExt(ApexPages.StandardController sc){
        List<String> lstOfCollegeAppFields = new List<String>{'College__c'};
        sc.addFields(lstOfCollegeAppFields );
        collegeApp = (CollegeApplication__c)sc.getRecord();
        editMode = false;
        college = new Account();
        
        if(collegeApp.College__c != null){
            college = [SELECT Id,Name,ETSInstitutionalCode__c, ETSDepartmentCode__c, Description FROM Account WHERE Id = :collegeApp.College__c];
        }
        
    }
    
    public void saveAccount(){
        update college;
        editMode=false;
    }
    public void editAccount(){
        editMode = true;
    }
    public void cancelEdit(){
        editMode=false;
    }
}