public class AddCommentsInlineExt {

    public CollegeApplication__c caObj {get;set;} 
    public AddCommentsInlineExt(ApexPages.StandardController controller) {
        controller.addFields(new List<String>{'Add_Comments__c'});
        caObj = (CollegeApplication__c) controller.getRecord();
    }
    
    public void saveAddComments(){
        update caObj;
    }
}