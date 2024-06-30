public class Integration_JG_EG2 {
    public void generateJSON(){
        System.JSONGenerator jg = JSON.createGenerator(true);
        jg.writeStartObject();
        try{
            List<Account> listOfAccounts =[SELECT Name,Phone,Industry FROM Account WHERE Phone != null AND Name != 'Sai' LIMIT 5];
            for(Account eachAcc : listOfAccounts){
                jg.writeStringField('Name',eachAcc.Name);
                jg.writeStringField('Status','Success');
                jg.writeNumberField('Code',200);
            }
        }catch(Exception ex){
            jg.writeStringField('Status','Failure');
            jg.writeNumberField('Code',400);
            jg.writeStringField('Status','Failure');
            jg.writeStringField('Error',ex.getMessage());
        }
        jg.writeEndObject();
        String Result = jg.getAsString();
        System.debug(Result);
    }
}