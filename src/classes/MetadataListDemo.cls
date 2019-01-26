public class MetadataListDemo {
    // Pass in the endpoint to be used using the string url
    public static List<MetadataService.Metadata> getListMetadataByType(String componentType,List<String> lstComponentNames){
        List<MetadataService.Metadata> lstMetadataRecords = new List<MetadataService.Metadata>();
        MetadataService.MetadataPort service = new MetadataService.MetadataPort();
        service.SessionHeader = new MetadataService.SessionHeader_element();
        service.SessionHeader.sessionId = UserInfo.getSessionId();
        try{
            if(lstComponentNames != null && lstComponentNames.size() > 0)
            {
                /*MetadataService.IReadResult readResult = (MetadataService.ReadResult)service.readMetadata(componentType,lstComponentNames);
                lstMetadataRecords = readResult.getRecords();
                
                for(MetadataService.Metadata md: lstMetadataRecords)
                {
                    MetadataService.WorkflowRule workflow = (MetadataService.WorkflowRule) md;
                    System.debug('@@@IS Active --> ' + workflow.active);
                }*/
                
                List<MetadataService.WorkflowRule> lstWFN = (List<MetadataService.WorkflowRule>)service.readMetadata(componentType,lstComponentNames).getRecords();
                System.debug('@@@@@@@@@ lstWFN ---> ' + lstWFN);
            }
        }catch (Exception ce){
            System.debug('@@@@@@@@@ Exception ---> ' + ce.getMessage());
        }
        return lstMetadataRecords;
    }
}