trigger OpportunityTrigger on Opportunity (after INSERT, after UPDATE, after DELETE, after UNDELETE) {
	if((Trigger.isInsert && Trigger.isAfter)||(Trigger.isUpdate && Trigger.isAfter)|| (Trigger.isUnDelete && Trigger.isAfter)){
       OpportunityTriggerHandler.populateTotalOpportunityAmount(Trigger.new);
    }
    else if((Trigger.isDelete && Trigger.isAfter)){
       OpportunityTriggerHandler.populateTotalOpportunityAmount(Trigger.old);
    }
    
}