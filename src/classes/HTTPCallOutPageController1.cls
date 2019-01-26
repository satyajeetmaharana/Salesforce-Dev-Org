public class HTTPCallOutPageController1{
    public String endPointUrl{get;set;}
    public String response{get;set;}
    public void callHTTP(){
        HttpRequest req = new HttpRequest();
        req.setEndpoint(endPointUrl); 
        req.setMethod('GET');
        req.setHeader('Authorization', 'Bearer ' + UserInfo.getSessionID());
        req.setHeader('Content-Type', 'application/json');
        Http h = new Http();
        HttpResponse res = h.send(req);
        response =res.getBody();
    }
}