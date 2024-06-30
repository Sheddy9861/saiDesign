public class BindingQuery {
    public static List<Account> simpleBindingQuery(Map<String, Object> bindParams){
    	String queryString ='SELECT Id, Name '+'FROM Account '+ 'WHERE name =:name';
        
        return Database.queryWithBinds(queryString, bindParams, AccessLevel.USER_MODE);
    }
}