trigger AccountTriggersHandler on Account (before update){ 
    list<contact> conlist = new list<contact>();
    set<id> accidset = new set<id>();
    
    for(account acc: trigger.new){
        if(trigger.isUpdate){
        account oldaccount = (account)trigger.oldmap.get(acc.id);
        if(acc.Description != oldaccount.Description){
        accidset.add(acc.Id);
        }
        }
    }  
    list<account> acclist = [select id, Name, Description, (select id, name, description from Contacts)  
                             from account where id =: accidset];
   
    for(account a: acclist){
        for(contact c: a.contacts){
           c.Description = a.Description; 
           conlist.add(c);
        }     
    }    
    update conlist;
}