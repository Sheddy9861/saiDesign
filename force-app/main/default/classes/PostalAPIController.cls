public class PostalAPIController {
    
    public String body;
    List<PostOfficesWrapper> listOfPOWrapp = new List<PostOfficesWrapper>();
    
    
    public void postOfficeSearch(){
        String endPointUrl = 'https://api.postalpincode.in/pincode/757001';
        
        Http http = new http();
        HttpRequest request = new HttpRequest();
        request.setHeader('Content-Type','application/json');
        request.setEndpoint(endPointUrl);
        request.setMethod('GET');
        
        HttpResponse response = http.send(request);
        body = response.getBody();
        List<JSON2Apex2> obj= (List<JSON2Apex2>)JSON.deserialize(body, List<JSON2Apex2>.class);
        
        for(Integer i = 0; i< obj[0].PostOffice.size(); i++){
            PostOfficesWrapper wrapObj = new PostOfficesWrapper();
            wrapObj.Name = obj[0].PostOffice[i].Name;
            wrapObj.BranchType = obj[0].PostOffice[i].BranchType;
            listOfPOWrapp.add(wrapObj);
        }
        System.debug(listOfPOWrapp);
        
    }
    
    public class PostOfficesWrapper{
        public String name;
        public String branchType;
    }
    
    
    public class JSON2Apex2 {
        public String Message;
        public String Status;
        public List<PostOffice> PostOffice;
        }
    public class PostOffice {
        public String Name;
        public Object Description;
        public String BranchType;
        public String DeliveryStatus;
        public String Circle;
        public String District;
        public String Division;
        public String Region;
        public String Block;
        public String State;
        public String Country;
        public String Pincode;
    }
}