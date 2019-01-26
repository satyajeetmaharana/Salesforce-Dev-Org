public class GenerateOppPDFExt{
    public Opportunity oppRec{get;set;}
    public List<OpportunityLineItem> lstOfOppLineItems{ get; set;}
    public GenerateOppPDFExt(ApexPages.StandardController sc){
        oppRec = [SELECT Id,Name,StageName,Account.Name,Type FROM Opportunity WHERE Id=:sc.getId()];
        lstOfOppLineItems = [Select Id, PriceBookEntry.Product2Id, PriceBookEntry.Product2.Name,PriceBookEntry.ProductCode,Discount,ListPrice,Quantity,Subtotal,TotalPrice from OpportunityLineItem WHERE OpportunityId = :sc.getId()];
    }    


}