public with sharing class HandlerFindUser implements BotHandler {
    
    public BotResponse handle(String utterance, String[] params, Map<String, String> session) {
        String key = '%' + params[0] + '%';
        List<User> users = 
            [SELECT Id, Name, Email, Profile.Name, UserRole.Name,Manager.Name,ManagerId FROM User
             WHERE Name LIKE :key
             ORDER BY Name
             LIMIT 5];
        List<PermissionSetAssignment> lstPermissionSet = new List<PermissionSetAssignment>([SELECT Id,PermissionSetId,PermissionSet.Name, AssigneeId FROM PermissionSetAssignment WHERE AssigneeId IN : users]);
        Map<String,List<String>> mapUserIdToPermissionSet = new Map<String,List<String>>();
        for(PermissionSetAssignment psa : lstPermissionSet){
            List<String> lstTemp = mapUserIdToPermissionSet.get(psa.AssigneeId);
            if(lstTemp == null)
                lstTemp = new List<String>();
            lstTemp.add(psa.PermissionSet.Name);
            mapUserIdToPermissionSet.put(psa.AssigneeId,lstTemp);
        }
        List<BotRecord> records = new List<BotRecord>();   
        for (User u : users) {
            List<BotField> fields = new List<BotField>();
            fields.add(new BotField('Name', u.Name, '#/sObject/' + u.Id + '/view'));
            fields.add(new BotField('Manager Name', u.Manager.Name, '#/sObject/' + u.ManagerId + '/view'));
            fields.add(new BotField('Email', u.Email, 'mailto:' + u.Email));
            fields.add(new BotField('Profile', u.Profile.Name, ''));
            fields.add(new BotField('Role', u.UserRole.Name, ''));
            if(mapUserIdToPermissionSet != null && mapUserIdToPermissionSet.containsKey(u.Id) && mapUserIdToPermissionSet.get(u.Id) != null)
                fields.add(new BotField('Permission Set Count',String.valueOf(mapUserIdToPermissionSet.get(u.Id).size())));
            records.add(new BotRecord(fields));
        }
        String responseMsg = '';
        if(users.size() != 0){
            responseMsg = 'Here is a list of users matching "' + params[0] + '":';
        }
        else{
            responseMsg = 'There is no such user matching "' + params[0] + '"';
        }
        return new BotResponse(new BotMessage('Bot',responseMsg , records));   
    }
}