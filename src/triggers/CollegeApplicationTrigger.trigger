trigger CollegeApplicationTrigger on CollegeApplication__c (before update,after insert) {
    
    if(Trigger.isUpdate){
        for(CollegeApplication__c ca : trigger.New){
            if(ca.Add_Comments__c != trigger.oldmap.get(ca.Id).Add_Comments__c){
                if(ca.LastCommentDump__c < Date.today().addDays(-2)){ca.AddCommentsDump__c = '';}
                ca.AddCommentsDump__c += '\n' +  trigger.oldMap.get(ca.Id).Add_Comments__c;
                ca.LastCommentDump__c = Date.today();
            }
        }
    }
    
    if(Trigger.isInsert){
        Map<Id,Id> toUpdate = new Map<Id,Id>();
        for(CollegeApplication__c ca : trigger.new){
            if(ca.College__c == null){
                List<String> lstStr = new List<String>();
                lstStr = ca.Name.split(' Fall');
                String accName ='';
                if(lstStr != null && lstStr.size() > 0)
                    accName = lstStr[0];
                else
                    accName = ca.Name;

                Account acc = new Account(Name=accName, RecordTypeId = '01228000000lif1');
                insert acc;
                toUpdate.put(ca.Id,acc.Id);


            }
        }
        
        
        List<CollegeApplication__c> lstCAToUpdate = new List<CollegeApplication__c>([SELECT Id,College__c FROM CollegeApplication__C WHERE Id IN :toUpdate.keySet()]);
        
        for(CollegeApplication__c ca : lstCAToUpdate){
            ca.College__c = toUpdate.get(ca.Id);
        
        }
        update lstCAToUpdate;
    }
}