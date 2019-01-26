public class CreateCompanyController{
    public Company__c companyRecord {get;set;}
    
    public CreateCompanyController(){
        companyRecord = new Company__c();
    }
    public PageReference save(){
        if(companyRecord.Name==null||companyRecord.Address__c==null||companyRecord.Zip_Code__c==null||companyRecord.State__c == null||companyRecord.Country__c == null||companyRecord.Company_Owner_Name__c==null){
             ApexPages.addmessage(new ApexPages.message(ApexPages.severity.WARNING,'Please Enter all values before saving'));
             return null;
        }
        else{
            try{
                insert companyRecord;
            }
            catch(Exception e){
                ApexPages.addmessage(new ApexPages.message(ApexPages.severity.WARNING,'Please Enter all values before saving'+e.getMessage()));
                return null;
            }    
            return new PageReference('/'+companyRecord.Id);
        }    
    }
    public PageReference saveAndEmployee(){
        if(companyRecord.Name==null||companyRecord.Address__c==null||companyRecord.Zip_Code__c==null||companyRecord.State__c == null||companyRecord.Country__c == null||companyRecord.Company_Owner_Name__c==null){
             ApexPages.addmessage(new ApexPages.message(ApexPages.severity.WARNING,'Please Enter all values before saving'));
             return null;
        }
        else{
            try{
                insert companyRecord;
            }
            catch(Exception e){
                ApexPages.addmessage(new ApexPages.message(ApexPages.severity.WARNING,'Please Enter all values before saving'+e.getMessage()));
                return null;
            }    
            return new PageReference('/apex/CreateEmployee?cid='+companyRecord.Id);
        } 
    }
    public PageReference cancel(){
        companyRecord = null;
        return null;
    }
}