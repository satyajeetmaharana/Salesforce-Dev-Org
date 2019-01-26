trigger FeedCommentTrigger on FeedComment (after insert) 
{
    Map<String,List<FeedComment>> mapCaseIdToLstFeedComment = new Map<String,List<FeedComment>>();
    for(FeedComment feedComment : Trigger.New)
    {
        
        String parentId = feedComment.ParentId;
        String relatedRecordId = feedComment.RelatedRecordId;
        if(parentId.startsWith('500'))
        {
            List<FeedComment> tempList = mapCaseIdToLstFeedComment.get(parentId);
            if(tempList == null)
                tempList = new List<FeedComment>();
            tempList.add(feedComment);
            mapCaseIdToLstFeedComment.put(parentId,tempList);
        }
        if(relatedRecordId != null && relatedRecordId.startsWith('500'))
        {
            List<FeedComment> tempList = mapCaseIdToLstFeedComment.get(relatedRecordId);
            if(tempList == null)
                tempList = new List<FeedComment>();
            tempList.add(feedComment);
            mapCaseIdToLstFeedComment.put(relatedRecordId,tempList);
        }
    }
    SYSTEM.DEBUG('@@@@@@@@@@@@@@@@@@ FEED COMMENT' + Trigger.New[0]);
    if(mapCaseIdToLstFeedComment != null && !mapCaseIdToLstFeedComment.isEmpty())
    {
        List<Case> lstCasesToUpdate = new List<Case>([SELECT Id,Case_Requester__c,OwnerId, Last_Owner_Comment_Date__c, Last_Requester_Comment_Date__c FROM Case WHERE Id IN :mapCaseIdToLstFeedComment.keySet()]);
        for(Case caseRecord : lstCasesToUpdate)
        {
            for(FeedComment feedComment : mapCaseIdToLstFeedComment.get(caseRecord.Id))
            {
                if(feedComment.CreatedbyId == caseRecord.OwnerId)
                    caseRecord.Last_Owner_Comment_Date__c = System.Now();
                if(feedComment.CreatedById == caseRecord.Case_Requester__c)
                    caseRecord.Last_Requester_Comment_Date__c = System.Now();
            }            
        }
        
        update lstCasesToUpdate;
   
    }
}