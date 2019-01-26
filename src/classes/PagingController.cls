public with sharing class PagingController {
    public ApexPages.StandardSetController con {
        get {
            if(con == null) {
                con = new ApexPages.StandardSetController(Database.getQueryLocator([Select Company,Approval_Status__c FROM Lead Order By Company limit 100]));                
                con.setPageSize(5);
            }
            return con;
        }set;
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