trigger OpportunityLineItemTrigger on OpportunityLineItem (after Insert) {
    if(Trigger.isAfter && Trigger.isInsert){
        OpportunityLineItemTriggerHandler.updateAccountDetails(Trigger.new);
    }
}