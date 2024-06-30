public class PracticeBatchClass_Example1 implements Database.Batchable<sObject>, Database.Stateful {
    private Integer statefulCount = 0;
    private Static Integer staticCount=0;
    public Database.QueryLocator start(Database.BatchableContext bc){
        String query = 'SELECT Id, Name FROM Contact LIMIT 15';
        return Database.getQueryLocator(query);
    }
    public void execute(Database.BatchableContext bc, List<sObject> records){
        for(Contact eachContact : (List<Contact>)records){
            statefulCount++;
            staticCount++;
        }
    }
    public void finish(Database.BatchableContext bc){
        System.debug('StateFul Count '+statefulCount);
        System.debug('Static Count '+staticCount);
    }
}