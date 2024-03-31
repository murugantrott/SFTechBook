trigger CaseTrigger on Case (before insert, before update) {
    list<case> newCaselist = (list<case>)Trigger.new;   
    map<Id,case> oldaccmap = (map<Id,case>)Trigger.oldMap;
    
    if(trigger.isUpdate){
    for(Case c: trigger.old){
        c.counter__c += 1;
    } 
    }    
}