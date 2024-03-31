trigger AccountTrigger on Account (before insert, before update, after insert, after update){
    
    list<account> newacclist = (list<account>)trigger.new;
    map<id,account> oldaccmap = trigger.oldmap;
    
    if(trigger.isupdate){
        for(account acc: newacclist){
            acc.Counter__c +=1;
            system.debug('debug test');
        }
    }
    

}