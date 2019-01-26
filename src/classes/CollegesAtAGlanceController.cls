public class CollegesAtAGlanceController {

    public List<CollegeApplicationWrapper> lstCollegeApplicationWrapper {get;set;}
    public String rowCollegeAppId {get;set;}
    public String rowCollegeAppSaveId{get;set;}
    public String rowCollegeAppCancelId{get;set;}
    public CollegesAtAGlanceController(){
        lstCollegeApplicationWrapper = new List<CollegeApplicationWrapper>();
        Map<Id,Account> mapInterestedColleges = new Map<Id,Account>([SELECT Id,Rating,Interested__c,Name FROM Account]);
        for(CollegeApplication__c collegeApplication :  [SELECT Id,Name,College__c,Status__c,Deadline__c,WindowOpen__c,LoginPage__c,Username__c,Password__c,HomePage__c,YocketLink__c,College__r.Rating,IsInactive__c FROM CollegeApplication__c WHERE IsInactive__c = false AND College__c IN :mapInterestedColleges.keySet()]){
            lstCollegeApplicationWrapper.add(new CollegeApplicationWrapper(mapInterestedColleges.get(collegeApplication.College__c),collegeApplication,false));
        }
    }
    
    
    public Class CollegeApplicationWrapper{
        public Account college{get;set;}
        public CollegeApplication__c collegeApplication{get;set;}
        public Boolean expanded{get;set;}
        
        public CollegeApplicationWrapper(Account college,CollegeApplication__c collegeApplication,Boolean expanded){
            this.college =college;
            this.collegeApplication = collegeApplication;
            this.expanded = expanded;
        }
        
    }
    
    public PageReference makeRowEditable(){
        for(CollegeApplicationWrapper collegeApplicationobj : lstCollegeApplicationWrapper){
            if(rowCollegeAppId.equals(collegeApplicationobj.collegeApplication.Id)){
                collegeApplicationobj.expanded= true;
            }
        }
        return null;
    }
    
    public PageReference saveRow(){
        rowCollegeAppId = '';
        for(CollegeApplicationWrapper collegeApplicationobj : lstCollegeApplicationWrapper){
            if(rowCollegeAppSaveId.equals(collegeApplicationobj.collegeApplication.Id)){
                collegeApplicationobj.expanded= false;
            }
        }
        return null;
        
    }
    
    public PageReference cancel(){
        rowCollegeAppId = '';
        for(CollegeApplicationWrapper collegeApplicationobj : lstCollegeApplicationWrapper){
            if(rowCollegeAppCancelId.equals(collegeApplicationobj.collegeApplication.Id)){
                collegeApplicationobj.expanded= false;
            }
        }
        return null;
        
    }
}