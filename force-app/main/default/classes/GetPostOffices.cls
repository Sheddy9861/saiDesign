public class GetPostOffices {
    @AuraEnabled
   public static List<PostalResponseWrapper> getPostOfficesDetails(){
        List<PostalResponseWrapper> postalList = new List<PostalResponseWrapper>();
        
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://api.postalpincode.in/pincode/272002');
        request.setMethod('GET');
        request.setHeader('content-type','application/json');
        HttpResponse response = http.send(request);
        System.debug('RESPONSE::::'+response.getBody());
        
        if(response.getStatusCode() == 200){
            JSONParser parser = JSON.createParser(response.getBody());
            parser.nextToken();
            while(parser.nextToken() != NULL){
                if(parser.getcurrentToken() == JSONTOKEN.START_ARRAY){
                    while(parser.nextToken() != NULL){
                        if(parser.getcurrentToken() == JSONTOKEN.START_OBJECT){
                            PostalResponseWrapper eachPostal = (PostalResponseWrapper)parser.readValueAs(PostalResponseWrapper.class);
                            postalList.add(eachPostal);
                            System.debug('EachPOSTAL:::'+eachPostal);
                        }
                    }
                }
            }
        }
        System.debug('LIST::::'+postalList);
        return postalList;
    }

    public class PostalResponseWrapper{
            @AuraEnabled
            public String Name;
            @AuraEnabled
            public Object Description;
            @AuraEnabled
            public String BranchType;
            @AuraEnabled
            public String DeliveryStatus;
            @AuraEnabled
            public String Circle;
            @AuraEnabled
            public String District;
            @AuraEnabled
            public String Division;
            @AuraEnabled
            public String Region;
            @AuraEnabled
            public String Block;
            @AuraEnabled
            public String State;
            @AuraEnabled
            public String Country;
            @AuraEnabled
            public String Pincode;
        }
}