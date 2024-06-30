public class ContactTriggerHandler {
    public static void createOpportunity(List<Contact> contactList){
        Set<Id> setOfAccountIds = new Set<Id>();
        List<Opportunity> listOfOpps = new List<Opportunity>();
        for(Contact eachContact : contactList){
            if(eachContact.AccountId != null){
                setOfAccountIds.add(eachContact.AccountId);
            }
            List<Account> listOfAccounts = [SELECT Id, Name FROM Account WHERE Id IN : setOfAccountIds];
            for(Account eachAccount : listOfAccounts){
                Opportunity newOpp = new Opportunity();
                newOpp.AccountId = eachAccount.Id;
                newOpp.Name = eachAccount.Name;
                newOpp.CloseDate = System.Today() + 15;
                newOpp.StageName = 'Prospecting';
                newOpp.Amount = 1000;
                listOfOpps.add(newOpp);
            }
            if(listOfOpps.size() != null){
                INSERT listOfOpps;
            }
        }
    }
}