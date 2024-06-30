public class JSONSerialize {
    public String getAccountsInJSONFormat(List<Account> accounts){
        String result;
        for(Account eachAcc : accounts){
            result= JSON.serializePretty(eachAcc);
        }
        System.debug(result);
        return result;
    }
    
}