public class ViewContactsPageController{
    public Id accountId {get;set;}
    public Account accountRecord{get;set;}
    public List<Contact> selectedContacts{
        get{
            if(selectedContacts == null){
                selectedContacts = new List<Contact>();
                for(WrapperContact wrapperRec :lstOfWrapperContact){
                    if(wrapperRec.selected == true){
                        selectedContacts.add(wrapperRec.con);
                    }
                }
            }    
            return selectedContacts;
        }
        set;
    }
    //public List<Contact> lstOfContacts {get;set;}
    //List<WrapperContact> lstOfWrapperContact{get;set;}
    public ViewContactsPageController(ApexPages.StandardController sc){
        accountId = sc.getId();    
        //lstOfContacts = new List<Contact>();
        //lstOfContacts = [SELECT Id,Name,Phone,Email FROM Contact WHERE Account.Id=:accountId];
    }
    
    
    public PageReference deleteContacts(){
        /*for(WrapperContact wrapperRec :lstOfWrapperContact){
            if(wrapperRec.selected == true){
                selectedContacts.add(wrapperRec.con);
            }
        }*/
        
        if(selectedContacts!=null){
            for(Contact con : selectedContacts){
                try{
                    delete con;
                }
                
                catch(Exception e){
                    ApexPages.addmessage(new ApexPages.message(ApexPages.severity.WARNING,'The selected contact could not be deleted as it is associated with cases. '));
                    lstOfWrapperContact = null;
                    selectedContacts = null;
                    return null;
                }    
            }
            lstOfWrapperContact = null;
            selectedContacts = null;
            return null;
        }
        else{
            ApexPages.addmessage(new ApexPages.message(ApexPages.severity.WARNING,'Please select atleast one contact to delete.'));
            return null;
        }
    }
    public List<WrapperContact> lstOfWrapperContact{
            get{
                if(lstOfWrapperContact == null) {
                    lstOfWrapperContact = new List<WrapperContact>();
                    for(Contact contactRec : [SELECT Id,Name,Phone,Email FROM Contact WHERE Account.Id=:accountId]){
                            lstOfWrapperContact.add(new WrapperContact(contactRec));
                    }
                }
                return lstOfWrapperContact;
            }
            
            set;
   }         
    
    public class WrapperContact{
        public Contact con{get;set;}
        public Boolean selected{get;set;}
        
        public wrapperContact(Contact con){
            this.con = con;
            this.selected = false;
        }
    }        
    
    public void showEdit(){
        
    
    
    }
}