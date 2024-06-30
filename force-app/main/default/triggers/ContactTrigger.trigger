trigger ContactTrigger on Contact (after INSERT, after UPDATE, after DELETE, after UNDELETE) {
    if((Trigger.isInsert || Trigger.isUpdate || Trigger.isUndelete) && (Trigger.isAfter)){
       ContactRollup.rollupContacts(Trigger.new);
    }
    if((Trigger.isDelete) && (Trigger.isAfter)){
       ContactRollup.rollupContacts(Trigger.old);
    }
}