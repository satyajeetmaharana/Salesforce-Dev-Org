public class CaseStudy2{

    public static void notifyMail(List <Case> newCases){
    
        List <Task> lstOfTasks = new List<Task>(); 
        List<Messaging.SingleEmailMessage> mails = new List<Messaging.SingleEmailMessage>();
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
       
        EmailTemplate emailTemplate = [SELECT id FROM EmailTemplate WHERE developerName = 'CaseRegisteredNotificationMail'];
       
        for(Case newCase : newCases){
            Task task = new Task();
            task.Subject = newCase.Subject;
            task.OwnerId = newCase.OwnerId;
            task.WhatId = newCase.AccountId;
            task.Priority = 'High';
            task.ActivityDate = Date.ValueOf(newCase.ClosedDate);
          
            lstOfTasks.add(task);
            
            Case cId = [SELECT Id FROM Case WHERE Id = :newCase.Id LIMIT 1];
           
            mail.setTargetObjectId(newCase.ContactId);
            mail.setWhatId(newCase.Id);
            
            mail.setTemplateId(emailTemplate.Id);
               
            mails.add(mail);
        }
        
        mail.saveAsActivity = false;
        //Send Mail
        Messaging.sendEmail(mails);
        //Insert the tasks
        insert lstOfTasks;
    }
}