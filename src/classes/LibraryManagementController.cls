public class LibraryManagementController {
    public List <Book__c> lstOfBooks = new List<Book__c>(); 
    public String book_name { get; set; }
    public String author { get; set; }
    public String edition { get; set; }
    public String date_of_issue { get; set; }
    
    
    public LibraryManagementController() { 
    
    }
    
      public Date stringToDate(String s){
          String[] stringDate = s.split('/');
          Integer m =  Integer.valueOf(stringDate[0]);
          Integer d = Integer.valueOf(stringDate[1]);
          Integer y = Integer.valueOf(stringDate[2]);
          return date.newInstance(y,m,d);
    }

    
    public void saveToTable() { 
        Book__c book = new Book__c(); 
        book.Name = book_name;
        book.author__c = author;
        book.edition__c = edition;
        book.date_of_issue__c = stringToDate(date_of_issue);
        book.recalculateFormulas();
        lstOfBooks.add(book);
    }
    
    public void deleteFromTable(){
        Integer indexVal = Integer.valueof(system.currentpagereference().getparameters().get('index'));
        lstOfBooks.remove(indexVal-1);
        
    }
    
    public void saveToDatabase(){
    
        List <Book__c> lstOfBooksDatabase = new List<Book__c> ();
        lstOfBooksDatabase = [SELECT Name FROM Book__c];
        Boolean flag = true;
        List<Integer> indexToBeRemoved = new List<Integer>(); 
        Integer index = 0;
        
        
        for( Book__c b : lstOfBooks){
            for ( Book__c bDb : lstOfBooksDatabase){
                if(b.Name.equals(bDb.Name)){
                    indexToBeRemoved.add(index);
                }
            }    
            index++;
        }
        
        for(Integer i : indexToBeRemoved){
            ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'This Book has been already requested: ' + lstOfBooks[i].Name));
            lstOfBooks.remove(i);
        }
        
        if(lstOfBooks.size()>0){
            ApexPages.addmessage(new ApexPages.message(ApexPages.severity.INFO,'Successfully requested the Books: '));
            for(Book__c b : lstOfBooks){        
                ApexPages.addmessage(new ApexPages.message(ApexPages.severity.INFO,b.Name));
            }   
        }
        insert lstOfBooks;
    }
    public List<Book__c> getLstOfBooks(){
        return lstOfBooks;
    }
}