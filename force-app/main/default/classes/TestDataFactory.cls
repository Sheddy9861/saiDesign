public with sharing class TestDataFactory {
    public static List<Account> createAccounts(Decimal numberOfAccs){
        List<Account> lisOfAccounts = new List<Account>();
        for(Decimal var=0 ; var<numberOfAccs; var++){
            Account accObj = new Account();
            accObj.Name ='TEST'+var;
            accObj.AccountNumber ='0001'+var;
            lisOfAccounts.add(accObj);
        }
        return lisOfAccounts;
    }

    public static List<Opportunity> createOpportunities(Decimal numberOfOpps){
        List<Opportunity> listOfOpportunity = new List<Opportunity>();
        for(Decimal var=0 ; var<numberOfOpps; var++){
            Opportunity oppObj = new Opportunity();
            oppObj.Name = 'TESTOPP'+var;
            oppObj.CloseDate = System.Date.today()+10;
            oppObj.StageName = 'Prospecting';
            listOfOpportunity.add(oppObj);
        }
        return listOfOpportunity;
    }
    
}