public class OpportunityTriggerHandler {
    public static void populateTotalOpportunityAmount(List<Opportunity> listOfOpportunity){
        Set<Id> setOfAccIds = new Set<Id>();
        Map<Id,Decimal> accIdAndAmount = new Map<Id,Decimal>();
        List<Account> accountsToUpdate = new List<Account>();  
        
        for(Opportunity eachOpp : listOfOpportunity){
            setOfAccIds.add(eachOpp.AccountId);
        }
        List<AggregateResult> result = [SELECT SUM(Amount) uAmount, AccountId FROM Opportunity 
                                        WHERE AccountId IN: setOfAccIds GROUP BY AccountId];
        if(!result.isEmpty()){
            for(AggregateResult aggRes : result){
                accIdAndAmount.put((Id)aggRes.get('AccountId'), (Decimal)aggRes.get('uAmount'));
            }  
        }
        
        accountsToUpdate =[SELECT Id, Total_Revenue_to_be_Generated__c FROM Account WHERE Id IN: accIdAndAmount.keySet()];
        
        for(Account eachAccount: accountsToUpdate){
            eachAccount.Total_Revenue_to_be_Generated__c = accIdAndAmount.get(eachAccount.Id);
        }
        try{
            Database.SaveResult[] results = Database.UPDATE(accountsToUpdate, true);
        }
        catch(DMLException e) {
            throw new DMLException('Unable to Perform the DML Operation on Account : ' +e.getMessage());
        }
    }
    
    
    public static Id insertAccount(String name, String email) {
        // code here
        Account eachAcc = new Account();
        eachAcc.Name = name;
        eachAcc.Website = email;
        
        INSERT eachAcc;
        return eachAcc.Id;
    }
}