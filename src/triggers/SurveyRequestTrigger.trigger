trigger SurveyRequestTrigger on Survey_Request__c (before update) 
{
    if(Trigger.isBefore)
    {       
        Map<Id,Survey_Request__c> oldMap  = new Map<Id,Survey_Request__c>();
        oldMap = Trigger.oldMap;
        
        for(Survey_Request__c surveyRequest : Trigger.New)
        {
            if(surveyRequest.Status__c != oldMap.get(surveyRequest.Id).Status__c && surveyRequest.Status__c == 'Stop')
            {
                surveyRequest.Stop_Started_Date__c = Date.Today();
            }
            else if(surveyRequest.Status__c != oldMap.get(surveyRequest.Id).Status__c && oldMap.get(surveyRequest.Id).Status__c == 'Stop')
            {
            
                if(surveyRequest.Total_Stop_Duration_in_Days__c == null)
                {
                    surveyRequest.Total_Stop_Duration_in_Days__c = 0;
                }
                if(surveyRequest.Stop_Started_Date__c != null)
                    surveyRequest.Total_Stop_Duration_in_Days__c += surveyRequest.Stop_Started_Date__c.DaysBetween(Date.Today());
            }
        }
    }
}