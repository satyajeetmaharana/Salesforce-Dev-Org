public class BookController {
    public String bookName { get; set; }
    public String author {get;set;}
    public String Edition {get;set;}
    public Date dateOfIssue {get; set;}
    public Book__c bookRecord { get; set; }
    public Id bookId {get; set; }
    public Boolean newBook{get;set;}
    
    public BookController(ApexPages.StandardController sc){
        bookId = ApexPages.currentPage().getParameters().get('Id');
        if(bookId!=null){
            newBook=false;
            bookRecord = new Book__c();
            bookRecord = [SELECT Id,Name,Author__c,Edition__c,Date_Of_Issue__c FROM Book__c WHERE Id = :bookId ];
        }
        else{
            bookRecord = new Book__c();
        }
    }
    
    public PageReference save(){
        if(bookId!=null){
                update bookRecord;
            }
            else{
                insert bookRecord;
            }
        return new PageReference('/' + bookRecord.Id);
    }
    
    public PageReference saveAndNew(){
        if(bookRecord.Name==null||bookRecord.Name==''){
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR,'Error: Please Enter Book Name.'));
            update bookRecord;
        }
        return new PageReference('https://c.ap2.visual.force.com/apex/BookNewPages');
    }
    
    public PageReference cancel(){
        return null;
    
    }

}