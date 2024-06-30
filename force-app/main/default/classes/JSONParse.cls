public class JSONParse {
    public static List<Account> parsingJSON(){
        List<Account> listOfAccount = new List<Account>();
        String inputJSON ='[{"attributes":{"type":"Account","url":"/services/data/v55.0/sobjects/Account/00158000002zBhUAAU"},"Id":"00158000002zBhUAAU","Name":"Customer1"},{"attributes":{"type":"Account","url":"/services/data/v55.0/sobjects/Account/00158000002zBhWAAU"},"Id":"00158000002zBhWAAU","Name":"Customer2"}]';
        JSONParser parser = JSON.createParser(inputJSON);
      	List<Account> acc = (List<Account>)JSON.deserialize(inputJSON, List<Account>.class);
        System.debug('List of Account'+acc);
        return acc;
    }
}