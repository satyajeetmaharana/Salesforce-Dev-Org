public class HttpCalloutSample2 {

    // Pass in the endpoint to be used using the string url
    public static List<String> getCalloutResponseContents(String componentType){
        List<String> lstComponentNames = new List<String>();
        DHC_MetadataServiceWorkflow.MetadataPort service = new DHC_MetadataServiceWorkflow.MetadataPort();
        service.SessionHeader = new DHC_MetadataServiceWorkflow.SessionHeader_element();
        service.SessionHeader.sessionId = UserInfo.getSessionId();
        try{
            DHC_MetadataServiceWorkflow.ListMetadataQuery query = new DHC_MetadataServiceWorkflow.ListMetadataQuery();
            //query.folder = 'CustomObject';
            query.type_x = componentType;
            //query.setFolder(null);
            double asOfVersion = 40.0;
            // Assuming that the SOAP binding has already been established.
            DHC_MetadataServiceWorkflow.FileProperties[] lmr = service.listMetadata(new DHC_MetadataServiceWorkflow.ListMetadataQuery[] {query}, asOfVersion);
            if (lmr != null) {
                for (DHC_MetadataServiceWorkflow.FileProperties n : lmr) {
                    lstComponentNames.add(n.fullName);
                    System.debug('Component fullName: ' + n.fullName);
                }
            }            
        }catch (Exception ce){
            System.debug('@@@@@@@@@ Exception ---> ' + ce.getMessage());
        }
        return lstComponentNames;
    }
}