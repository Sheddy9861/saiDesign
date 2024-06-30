public class CalloutAccountCreation {
	@future(callout=true)
    public static void sendData(Set<Id> accIds){
        List<Account> accountDetails= [SELECT Id, Name,Rating,AccountNumber FROM Account WHERE Id IN:accIds];
        //Create JSON of the Account in this format
        String jsonToBeSent = JSON.serialize(accountDetails);
        
        HttpRequest request = new HttpRequest();
        HttpResponse response = new HttpResponse();
        Http http = new Http();
        request.setEndpoint('callout:SFDC_TO_SFDC'+'/services/apexrest/accountSync');
        request.setMethod('POST');
        request.setHeader('Content-Type', 'application/json');
        request.setBody(jsonToBeSent);
        
        
    }
}