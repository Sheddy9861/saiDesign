public class ContactRollUp {
    public static void rollupContacts(List<Contact> listOfContacts){
        Set<Id> setOfIds = new Set<Id>();
        Map<Id,Decimal> mapOfAccIDAndCount = new Map<Id,Decimal>();
        List<Account> listOfAccountsToUpdate = new List<Account>();
        for(Contact eachContact : listofContacts){
            setOfIds.add(eachContact.AccountId);
        }
        List<AggregateResult> result = [SELECT AccountId, COUNT(Id) uCount FROM Contact WHERE AccountId IN:setOfIds
                                        GROUP BY AccountId];
        if(!result.isEmpty()){
            for(AggregateResult agg : result){
                mapOfAccIDAndCount.put((Id)agg.get('AccountId'), (Decimal)agg.get('uCount'));
            }
            listOfAccountsToUpdate = [SELECT Id FROM Account WHERE Id IN: mapOfAccIDAndCount.keyset()];
            for(Account eachAccount: listOfAccountsToUpdate){
                eachAccount.Number_of_Contacts__c = mapOfAccIDAndCount.get(eachAccount.Id);
            }
            try{
                UPDATE listOfAccountsToUpdate;
            }catch(Exception ex){
                System.debug('Exception:::'+ex);
            }
        }
    }
}