public with sharing class OpenCageGeoCoderUtil {
    public static void forwardGeoCoding(Id accRecordID){
        String endPoint = System.label.OpenCageURL; //Used System Label to store the URL
        String apiKey = System.label.OpenCageKey; 
        String encoded ='';
        String errorMessage ='';
        
        Account accRec = [SELECT Id,BillingStreet,BillingCity,BillingPostalCode,BillingState, BillingCountry,Address__Latitude__s, Address__Longitude__s FROM Account WHERE Id =: accRecordID];
        String billingAddress = accRec.BillingStreet+','+accRec.BillingCity+','+accRec.BillingState+','+accRec.BillingCountry;
        encoded = EncodingUtil.urlEncode(billingAddress, 'UTF-8'); 
        String finalEndPoint = endpoint+'q='+encoded+'&key='+apiKey+'&pretty=1';

        Http http = new Http();
        HttpRequest request = new HttpRequest();
        HttpResponse response = new HttpResponse();
        request.setMethod('GET');
        request.setEndpoint(finalEndPoint);
        
        
        //https://api.opencagedata.com/geocode/v1/json?q=Frauenplan+1%2C+99423+Weimar%2C+Germany&key=de404992eaeb4d789dc4d1281cd13e74
        
        try{
            response = http.send(request);
            if( response.getStatusCode() == 200 ){
                String body = response.getBody();
                //System.debug(System.LoggingLevel.DEBUG,'Body' + body);
                OpenCageWrapper openCageWrap = (OpenCageWrapper) System.JSON.deserialize(body, OpenCageWrapper.class);
                List<OpenCageWrapper.cls_results> openGeoResults = openCageWrap.results;
                if(!openGeoResults.isEmpty()){
                    OpenCageWrapper.cls_results results = openGeoResults.get(0);
                    System.debug('DEBUGGGG:::'+results);
                    accRec.Address__Latitude__s= results.geometry.lat;
                    accRec.Address__Longitude__s = results.geometry.lng;
                    System.debug('ACC:::'+accRec);
                    UPDATE accRec;
                }
            }
        }catch(Exception ex){
            errorMessage = 'Unexpected Error while communicating with OpenCage API '+
                            'Status '+ response.getStatus()+' and Status Code '+ response.getStatus();
        }

    }
}