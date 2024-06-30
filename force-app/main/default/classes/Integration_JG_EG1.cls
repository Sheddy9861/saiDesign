public class Integration_JG_EG1 {
    public void generateJSON(String NM, String PP, String IND){
        System.JSONGenerator jg = JSON.createGenerator(true);
        jg.writeStartObject();
        try{
            Account acc = new Account();
            acc.Name = NM;
            acc.Phone = PP;
            acc.Industry = IND;
            INSERT acc;
            
            jg.writeStringField('Status','Success');
            jg.writeIdField('Id',acc.Id);
            jg.writeStringField('Message','Account Created Successully');
            jg.writeNumberField('Code',100);
        }catch(Exception ex){
            jg.writeStringField('Status','Failed');
            jg.writeStringField('Message',ex.getMessage());
            jg.writeNumberField('Code',200);
        }
        jg.writeEndObject();
        String Result = jg.getAsString();
        System.debug(Result);
    }
}