/*
Date: 12/03/2024
Write an Apex trigger that rolls up the total value of all related Opportunity Line Items to a custom field on the Account object.*/
public class OpportunityLineItemTriggerHandler {
    public static void updateAccountDetails(List<OpportunityLineItem> listOfOppLineItems){
        Set<Id> oppIds = new Set<Id>();
        Decimal totalPrice = 0;
        Map<Id, Decimal> accIdVsAmount = new Map<Id, Decimal>();
        for(OpportunityLineItem eachLineItem : listOfOppLineItems){
            oppIds.add(eachLineItem.OpportunityId);
        }
        //Aggregate Query to fetch Total Price for OpportunityLineItem with AccountId
        List<AggregateResult> argObj = [SELECT SUM(TotalPrice)Price, OpportunityId, Opportunity.AccountId FROM OpportunityLineItem WHERE OpportunityId IN: oppIds GROUP BY OpportunityId,Opportunity.AccountId];
       	
        for(AggregateResult eachRes : argObj){
            totalPrice = (Decimal)eachRes.get('Price');
            if(accIdVsAmount.containsKey((Id)eachRes.get('AccountId'))){
                Decimal tempPrice = accIdVsAmount.get((Id)eachRes.get('AccountId'));
                Decimal finalPrice = tempPrice+ totalPrice;
                System.debug('Final Price:::'+ finalPrice);
                accIdVsAmount.put((Id)eachRes.get('AccountId'),finalPrice);
                
            }else{
                accIdVsAmount.put((Id)eachRes.get('AccountId'),(Decimal)eachRes.get('Price'));
            }
            
        }

        List<Account> listOfAccountToUpdate =[SELECT Id, Total_Opportunity_Line_Item__c FROM Account WHERE Id IN:     
                                             accIdVsAmount.keySet()];

        for(Account eachAccount : listOfAccountToUpdate){
            eachAccount.Total_Opportunity_Line_Item__c = accIdVsAmount.get(eachAccount.Id);
        }
        
        if(!listOfAccountToUpdate.isEmpty()){
            UPDATE listOfAccountToUpdate;
        }
    }
}