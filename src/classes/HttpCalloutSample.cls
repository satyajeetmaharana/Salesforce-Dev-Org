public class HttpCalloutSample {

  // Pass in the endpoint to be used using the string url
  public static void getCalloutResponseContents() {
    // Create a new http object to send the request object
    // A response object is generated as a result of the request  
    MetadataService.MetadataPort service = new MetadataService.MetadataPort();
    service.SessionHeader = new MetadataService.SessionHeader_element();
    service.SessionHeader.sessionId = UserInfo.getSessionId();
     
    try {
        MetadataService.ListMetadataQuery query = new MetadataService.ListMetadataQuery();
        //query.folder = 'CustomObject';
        query.type_x = 'WorkflowRule';
        //query.setFolder(null);
        double asOfVersion = 40.0;
        // Assuming that the SOAP binding has already been established.
        MetadataService.FileProperties[] lmr = service.listMetadata(new MetadataService.ListMetadataQuery[] {query}, asOfVersion);
        if (lmr != null) {
            for (MetadataService.FileProperties n : lmr) {
                System.debug('Component fullName: ' + n.fullName);
            }
        }            
    } catch (Exception ce) {
        System.debug('@@@@@@@@@ Exception ---> ' + ce.getMessage());
    }
  }
}