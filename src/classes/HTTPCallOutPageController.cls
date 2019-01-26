public class HTTPCallOutPageController{
    public String endPointUrl{get;set;}
    public String response{get;set;}
    public void callHTTP(){
        response = HttpCalloutSample.getCalloutResponseContents(endPointUrl);
    }
}