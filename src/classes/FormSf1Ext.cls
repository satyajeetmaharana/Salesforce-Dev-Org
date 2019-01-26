public class FormSf1Ext
{
    public Case caseRecord{get;set;}
    public FormSf1Ext(ApexPages.StandardController stdController)
    {
        caseRecord = new Case();
        
        
        
    }
}