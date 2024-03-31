public class ContactTriggerHandler {
    
    public static void CalcNoofConOnInsert(list<Contact> conlist){
        system.debug('HI');
        set<id> accountIdSet = new set<id>();
        Map<id, Account> accMap = new Map<id,Account>();
        
        for(contact conobj : conlist){
            if(conobj.AccountId != null){
                accountIdSet.add(conobj.AccountId);
            }
        }
        
        if(accountIdSet != null && accountIdSet.size() > 0) {
            for(aggregateResult agrResultobj: [select count(Id) contcount, AccountId from Contact where AccountId In: accountIdSet
                                               GROUP BY AccountId]){
                     account accObj = new account();
                     accObj.id = (id)agrResultobj.get('AccountId');      
                     accObj.NoOfContacts__c = (integer)agrResultobj.get('contcount');                           
                     
                     accMap.put(accObj.id, accObj);                                                       
              }
        }
        
        if(accMap != null && accMap.size() > 0){
            update accMap.values();
        }  
    }
    
    public static void CalcNoOfContactsOnDelete(list<contact> contactlist){
        set<id> accountIdSet = new Set<id>();
        Map<id, account> accountMap = new Map<id, account>();

        for(contact conobj: contactlist){
            if(conobj.AccountId != null){
                accountIdSet.add(conobj.AccountId);
            }
        }
        
        if(accountIdSet != null && accountIdSet.size() > 0){
            
            for(AggregateResult agrResultobj : [select count(id) contcount, AccountId from contact 
                                                where AccountId IN: accountIdSet AND Id NOT IN: contactlist GROUP BY AccountId]){
                     account accObj = new account();
                     accObj.Id = (id)agrResultobj.get('AccountId');
                     accObj.NoOfContacts__c = (integer)agrResultobj.get('contcount');                              
                     
                     accountMap.put(accObj.Id, accObj);                                                             
             }
            update accountMap.values();
        }
        
    }

}