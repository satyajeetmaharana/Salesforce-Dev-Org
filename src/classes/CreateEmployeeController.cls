public class CreateEmployeeController{
    public Employee__c employeeRecord{get;set;}
    public Company__c companyRecord{get;set;}
    public CreateEmployeeController(){
        employeeRecord = new Employee__c();
        Id companyId = System.currentPagereference().getParameters().get('cid');
        companyRecord = new Company__c();
        companyRecord = [SELECT Id,Name FROM Company__c WHERE Id = :companyId];
    }
    
    public PageReference save(){
        employeeRecord.Company__c = companyRecord.Id;
        if(employeeRecord.Name==null||employeeRecord.Designation__c==null||employeeRecord.Company__c==null||employeeRecord.Phone_Number__C==null||employeeRecord.Email__c==null){
            ApexPages.addmessage(new ApexPages.message(ApexPages.severity.WARNING,'Please Enter all values before saving'));
            return null;
        }
        else{
            try{
                insert employeeRecord;
            }
            catch(Exception e){
                ApexPages.addmessage(new ApexPages.message(ApexPages.severity.WARNING,'Please Enter all values before saving'+e.getMessage()));
                return null;
            }
            return new PageReference('/'+employeeRecord.Company__c);
        }    
    }    
    public PageReference cancel(){
        employeeRecord = null;
        return null;
    }
        
}