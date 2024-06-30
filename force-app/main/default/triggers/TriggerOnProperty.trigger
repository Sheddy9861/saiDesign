trigger TriggerOnProperty on PropertyTwo__c (before INSERT,before UPDATE) {
    if(Trigger.isbefore && Trigger.isInsert){
        PropertyTriggerHandler.onBeforeInsert(Trigger.new);
    }
    if(Trigger.isbefore && Trigger.isUpdate){
        PropertyTriggerHandler.onBeforeUpdate(Trigger.oldMap, Trigger.new);
    }
}