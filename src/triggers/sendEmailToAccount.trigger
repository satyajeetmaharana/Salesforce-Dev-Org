trigger sendEmailToAccount on Case(after insert)
{
    List<Case> lstCases=Trigger.new;
    if(Trigger.isAfter)
    {
        if(Trigger.isInsert)
        {
            SendEmailHandler email=new SendEmailHandler();
            email.sendEmailTest(lstCases);
        }
    }
}