public class LeadListExtension{
    List <Lead> lstOfLeads{get;set;} 
    public Integer pageSizeUser=10;
    public Integer totalRecords;
    public LeadListExtension(ApexPages.StandardSetController stdcontroller){
    }
    
    public List<Lead> getLstOfLeads(){
        lstOfLeads = con.getRecords();
        totalRecords = lstOfLeads.size();
        return lstOfLeads;
    }
    
    public ApexPages.StandardSetController con {
        get {
            if(con == null) {
                con = new ApexPages.StandardSetController(Database.getQueryLocator([SELECT Company,Approval_Status__c FROM Lead]));                
            }
            
            con.setPageSize(getpageSize());
            return con;
        }set;
    }
    public void setPageSize10(){
        pageSizeUser=10;
    }
    public void setPageSize20(){
        pageSizeUser=20;
    }
    public void setPageSize50(){
        pageSizeUser=50;
    }
    public void setPageSize100(){
        pageSizeUser=100;
    }
    public void setPageSize200(){
        pageSizeUser=200;
    }
    public Integer getPageSize(){
        return pageSizeUser;
    }
    
    public Integer getTotalPages(){
        Integer totalPages = totalRecords/getPageSize();
        return totalPages;
    }
    public Boolean hasNext {
        get {
            return con.getHasNext();
        }
        set;
    }
    public Boolean hasPrevious {
        get {
            return con.getHasPrevious();
        }
        set;
    }
    public Integer pageNumber {
        get {
            return con.getPageNumber();
        }
        set;
    }
    public void first() {
         con.first();
    }
    public void last() {
         con.last();
    }
    public void previous() {
         con.previous();
    }
    public void next() {
         con.next();
    }
    public void cancel() {
         con.cancel();
    }
}