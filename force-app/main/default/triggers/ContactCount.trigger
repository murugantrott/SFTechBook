trigger ContactCount on Contact (before insert, before delete) {
    
    if(trigger.isInsert && trigger.isBefore){
        ContactTriggerHandler.CalcNoofConOnInsert(trigger.new); 
    }
    
    if(trigger.isDelete && trigger.isBefore){
        ContactTriggerHandler.CalcNoofConOnInsert(trigger.old); 
    }

}