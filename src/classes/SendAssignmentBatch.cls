global class SendAssignmentBatch implements Database.Batchable<sObject>{

   global String query;

   global Database.QueryLocator start(Database.BatchableContext BC){
      query = 'SELECT Id,User__c,User__r.Email,User__r.FirstName,User__r.Name,Name,Date_Sent__c FROM Assignment__c';
      return Database.getQueryLocator(query);
   }

   global void execute(Database.BatchableContext BC, List<Assignment__c> lstAllAssignments){
     List<Assignment__c> lstAssignmentsToSend = new List<Assignment__c>();
     for(Assignment__c assignment: lstAllAssignments){
        if(assignment.Date_Sent__c == Date.Today().addDays(-2))
        {
            lstAssignmentsToSend.add(assignment);
        }
     }
     
     if(lstAssignmentsToSend!=null && lstAssignmentsToSend.size() > 0)
     {
         Map<Id,List<Attachment>> mapAssignmentIdToAttach = new Map<Id,List<Attachment>>();
         List<Attachment> lstAttach = new List<Attachment>([SELECT Id,Name,Body,ParentId FROM Attachment WHERE ParentId IN : lstAssignmentsToSend]);
         //SEND EMAIL WITH ATTACHMENTS
         if(lstAttach.size() > 0)
         {
             for(Attachment attach : lstAttach)
             {
                 List<Attachment> tempAttach = mapAssignmentIdToAttach.get(attach.ParentId);
                 if(tempAttach == null)
                     tempAttach = new List<Attachment>();
                 tempAttach.add(attach);
                 mapAssignmentIdToAttach.put(attach.ParentId,tempAttach);
             }
         }
        
        if(mapAssignmentIdToAttach != null && mapAssignmentIdToAttach.size() > 0)
        {
            for(Assignment__c assignment : lstAssignmentsToSend)
            {
                Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
                String[] toAddresses = new String[]{assignment.User__r.Email};
                mail.setToAddresses(toAddresses);
                mail.setSubject('Assignment - ' + Date.Today().addDays(+1));
                mail.setHTMLBody('Hi ' + assignment.User__r.FirstName +', <br/><br/> PFA the assignment for <b>' + Date.Today().addDays(+1) +'</b>. <br/> Get it reviewed by EOD. Also mention the key learning points and challenges faced.<br/><br/> If you have ANY doubts, you can connect with us.<br/><br/> Thanks & Regards,<br/>Satyajeet Maharana<br/>Accenture | Pune<br/>+91 7030578454');
                mail.setTargetObjectId(assignment.User__c);
                mail.saveAsActivity = false;
               
                //Set email file attachments
                List<Messaging.Emailfileattachment> fileAttachments = new List<Messaging.Emailfileattachment>();
                for (Attachment a : mapAssignmentIdToAttach.get(assignment.Id))
                {
                    // Add to attachment file list
                    Messaging.Emailfileattachment efa = new Messaging.Emailfileattachment();
                    efa.setFileName(a.Name);
                    efa.setBody(a.Body);
                    fileAttachments.add(efa);
                }
                mail.setFileAttachments(fileAttachments);
                //Send email
                Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
            } 
        }
     }
    }

   global void finish(Database.BatchableContext BC){
   }
}