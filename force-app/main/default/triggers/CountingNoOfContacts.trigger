trigger CountingNoOfContacts on Contact (after insert, after update, after delete, after undelete) {
    
    list<contact> conlist = new list<contact>();
    set<id> accountIdSet = new set<id>();
    
    If(Trigger.isDelete){
        conlist = trigger.old;  
    }else{
        conlist = trigger.new;
    }
    
    for(contact con: conlist){
        if(con.AccountId != null){
            accountIdSet.add(con.AccountId);
        }
        
        If(Trigger.isUpdate){
            contact oldcontact= (contact)Trigger.OldMap.get(con.id); //map<id,sobject>
            
            if(oldcontact.AccountId != con.AccountId){
                accountIdSet.add(oldcontact.AccountId);
            }
        }
    }
   /* list<Account> accountlist = new list<Account>();
    list<AggregateResult> agrResult = [select AccountId, count(id) cont from contact where AccountId IN: accountIdSet GROUP BY AccountId];
     integer size = agrResult.size();
    
    for(integer i=0; i<size; i++){
        
        AggregateResult agr= agrResult.get(i);
        id accountId = (id)agr.get('AccountId');
        decimal count = (decimal)agr.get('cont');
        
        account acc = new account();
        acc.id = accountId;
        acc.NoOfContacts__c = count;
        accountlist.add(acc);
        
        if(accountIdSet.contains(accountId)){
            accountIdSet.remove(accountId);
        }
    }
    for(id accId: accountIdSet){
        account acc= new account(id= accId, NoOfContacts__c=0);
        accountlist.add(acc);
    }
    update accountlist;
*/
    
Map<id,Account> accountmap = new Map<id,Account>();
    list<contact> contactlist = [select id, name, AccountId from contact where AccountId IN: accountIdSet];
    
    for(contact c: contactlist){
        if(!accountmap.containsKey(c.AccountId)){
            account acc = new account();
            acc.Id = c.AccountId;
            acc.NoOfContacts__c= 1;
            accountmap.put(acc.Id, acc);
        }else{
            Account tempacc =  accountmap.get(c.AccountId);
            tempacc.Id = c.AccountId;
            tempacc.NoOfContacts__c +=1;
            accountMap.put(tempacc.Id, tempacc);
        }
    }
    update accountMap.values();
    
}