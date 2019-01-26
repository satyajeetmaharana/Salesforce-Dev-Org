public class RadioButtonPOCController
{
    public List<Account> accountList{get;set;}
    public String selectAccid{get;set;}
    public RadioButtonPOCController()
    {
        accountList = new List<Account>([SELECT Id, Name FROM Account]);
        
    }
    
    public PageReference showSelected ()
    {
        selectAccid = 'Selected Account Name is : ' + System.currentPagereference().getParameters().get('radioButton');
        return null;
    }
    
}