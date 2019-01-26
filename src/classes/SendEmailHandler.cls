public class SendEmailHandler
{
    public void sendEmailTest(List<Case> lstCase)
    {
            List<Messaging.SingleEmailMessage> sendEmail=new List<Messaging.SingleEmailMessage>();
            List<String> sendTo=new List<String>();
            List<Task> lstTasks=new List<Task>();
            
            for(Case myCase:lstCase)
            {
                Task myTask=new Task();
                myTask.Subject=myCase.Subject;
                myTask.OwnerId=myCase.OwnerId;
                myTask.Priority='Low';
                myTask.WhatId=myCase.AccountId;
                lstTasks.add(myTask);
                Messaging.SingleEmailMessage mail=new Messaging.SingleEmailMessage();

                    sendTo.add('swaraj.rout@accenture.com');
                    mail.setToAddresses(sendTo);
                    mail.setSenderDisplayName(myCase.Account.Name);
                       String body = 'Hi this is a test mail.  A new case has been registered';
        
        
            mail.setHtmlBody(body);
           
            mail.setToAddresses(sendTo);

                sendEmail.add(mail);
            }
            DataBase.insert(lstTasks);
            Messaging.sendEmail(sendEmail);
            
    }
}